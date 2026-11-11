Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9437606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4euHni90;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=gfI0vyH7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5LxVGBk0nGoYs31KnbsVJCWarpNoNytCYPFUuR+hl2o=; b=4euHni90KFKwk+
	Mu09MiQbdzmHub1JUcBliAMMzPuzHKXVxqqa+jD8EDg6I3NqR+2pLXdiOQ4GJ+HDROb9Y1T4LzFDq
	uXIAUllFuC3MNIcPj0de/hycDBO+jcrCkZQ3Zn0klHYAZH+JOWtAfOeQVgeV+ePkJ2BbOhPOQu8f6
	hOjwekdiA2xlZ29AYLDWF6QeVAsprWyephQ6CJUM44vIUEWwKW/MjltBXg/ddqK9AiNkPdldrBMXN
	P+Y6Dso83ZpwGImOpzpvPxCbqFgqmOgH5bwTjUFCSOgTXQpc652bAyrBkA6ndd0WeYS6ISyxQ4xDu
	3zgoTsumKCa+uWcA74Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5dl-00000006M6i-3yvp;
	Wed, 11 Nov 2026 10:33:17 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5de-00000006M4Q-0OsG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=gfI0vyH7pOB8czxqaryCpXcOBP99ohzOKmBD2emZCTRp6Yhy7gZdlmlI5eqc64hgvQ1y55j0ceWfn
	 HrF4uwLu9EU1fRdVUqJXMdoTgyl8icTLhY64s3LhZsOB/TPRdQy6iwk9O2oDUEJKdvulUsUXFXAxjJ
	 u72q/41jhoX80ISg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26af4445457d-14453;
	Wed, 11 Nov 2026 18:32:54 +0800 (CST)
X-RM-TRANSID: 2ee26af4445457d-14453
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af44454467-d960e;
	Wed, 11 Nov 2026 18:32:54 +0800 (CST)
X-RM-TRANSID: 2ee16af44454467-d960e
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	danishanwar@ti.com,
	rogerq@kernel.org,
	jan.kiszka@siemens.com,
	diogo.ivo@siemens.com,
	haokexin@gmail.com,
	horms@kernel.org,
	vigneshr@ti.com,
	m-malladi@ti.com,
	jacob.e.keller@intel.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 net 0/4] net: ti: icssg: Fix device_node handling in prueth_probe()
Date: Wed, 11 Nov 2026 18:32:51 +0800
Message-ID: <20261110161000.3143-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261110064118.1138-1-laixiangwu@cmss.chinamobile.com>
References: <20261110064118.1138-1-laixiangwu@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_023311_162265_F1CA6CFE 
X-CRM114-Status: UNSURE (   5.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

The netdev patchwork cc_maintainers check reports that some people
listed by get_maintainer.pl for the files touched by this series
were not on Cc:

- Vignesh Raghavendra <vigneshr@ti.com> (original contributor of
  the ICSSG driver code this series fixes)
- Meghana Malladi <m-malladi@ti.com>
- Jacob Keller <jacob.e.keller@intel.com>

Adding them here for visibility. They will be included directly in
the Cc list of any future revision of the series. No action is
required from them.

Best regards,
Xiangwu Lai



