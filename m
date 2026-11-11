Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C805606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 08:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jl2yRWfl;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=rOqEi8Sb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jAM+mhS6wH5+znM4cfUPLESvcCvLvb75hxMYxu2K7wQ=; b=jl2yRWflaHAc8fCoD+1TqjMvs9
	+pPPj4tXOk/IU+3G0B7302YB1dYwdmAslVAf7LBPZE0WzjwaB5AbSozOCjLdVp9bxCyumYFcYe53P
	8p7aPawEtesUBl7RfqFeSLlmbCGKCAGLDwkbFoB9VPAs8CxV2yRPFHL7u/6QITijBMhtJbKw0+JRa
	N/rtSocDlrtDS+DshTmde2OmwW2FKDy1zrNoRU90J0k8mcUI9iCXb6P8Tud+SwgAT9xBbap3eWy/z
	n9tmkEeIUUF8SKKFXgl9XkS4am2gl7arSzpkMCaHtVGQEuZ5Jp6Hq6DjncjquB+YtESnUHH2IpS10
	HswwGGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Sd-000000060uY-26F9;
	Wed, 11 Nov 2026 08:13:39 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3SY-000000060oW-3n4M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 08:13:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jAM+mhS6wH5+znM4cfUPLESvcCvLvb75hxMYxu2K7wQ=;
	b=rOqEi8SbwNgXAV7VA/R7FKhFNIL2rkCpVdDd22Rl/OKaRLSBEOIWnQ5apCziFUwmCKHbvfQDv
	RONgy4Vz3iCwthYm2ft2Lbbugm96ki/jXlbPAkwpGwuNSmpSA6Kq/FSSRtHwMlaZxNszSVx4E+A
	VIC61hy2UpRM4qvCqr+T3X8=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jPbqt68wCzLlVY;
	Wed, 11 Nov 2026 16:13:14 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 0D60640561;
	Wed, 11 Nov 2026 16:13:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 16:13:29 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <zengheng4@huawei.com>, <gshan@redhat.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 0/3] arm_mpam: resctrl: Fix several CDP bugs
Date: Wed, 11 Nov 2026 16:13:13 +0800
Message-ID: <20261111081316.3828283-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_001335_328742_B4B5B653 
X-CRM114-Status: UNSURE (   5.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix several mpam CDP bugs found by testing and AI review.

Changes in v4:
- Only enable CDP on a resource that supports it (Ben)
- Limit num_rmids to the CLOSIDs in use with a simplified fix (Ben)
- v3: https://lore.kernel.org/all/20261106081923.2333070-1-ruanjinjie@huawei.com/

Jinjie Ruan (3):
  arm_mpam: resctrl: Leave CDP off when there are too few PARTIDs
  arm_mpam: resctrl: Only enable CDP on a resource that supports it
  arm_mpam: resctrl: Limit num_rmids to the CLOSIDs in use

 drivers/resctrl/mpam_resctrl.c | 40 ++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 16 deletions(-)

-- 
2.34.1


