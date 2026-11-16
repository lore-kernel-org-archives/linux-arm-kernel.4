Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48BC606A891
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4w45xpFq;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=dC4hOLJ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LnD4QWUGvpl+vwERhoNXP0WiLVehgWtc8v4OUjLBKwA=; b=4w45xpFqmwZw+G
	6ZAVtBqXx9lDacH2xy7pihVHtTXzLWnU2OpYa4kK+81OqO7YaZTH64TfU6qPoyRuuLHiFRHCj0wLs
	g7/VPfUKnH67wIuWk8jWQEbcKRfXo+Odsw09arbwf2Rxl3Pr3Znpp4Fn0FUJvzoen0kODAcVXfE+S
	VhuS9NgaHmnYaxCBCx9FcLynqpluTdSDOoMYOn3fXk/p9EWPoaCroRv4S0fPATts3USZEbwlmgXLp
	NuOSs9CBmTHiVIKeCtP11QA5wDtfBvMbTi99WNKrB+7Y887SJnvwJZWtzhoe99edql8CmRFOChAzc
	iF9qYtEPTZjzh60Z+T6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSul9-000000029sY-3KH2;
	Mon, 16 Nov 2026 11:20:27 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSul5-000000029r6-3Qr5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ln
	D4QWUGvpl+vwERhoNXP0WiLVehgWtc8v4OUjLBKwA=; b=dC4hOLJ7S2mOvx+pyv
	L+HUOPozCfhuPp5GhY2DJ1wJDBr+BOGXfDjppyvOrQsNmYJUJunDuFoeTvjQLE1x
	kJ+u129IX5mN1VQwnSSx+7cPdda27MsW77JPrZP6wUV9tuJkATdzYc4Pxosv0g2Z
	j21G7gRk/IvpA8a1fK/ZNW/Cg=
Received: from mm (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCHjZnc5vpqFGb6GA--.31639S2;
	Mon, 16 Nov 2026 19:19:59 +0800 (CST)
From: Qi Xi <xiqi5703@163.com>
To: catalin.marinas@arm.com
Cc: benniu@meta.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sunnanyong@huawei.com,
	wangkefeng.wang@huawei.com,
	will@kernel.org
Subject: Re: [PATCH v3 0/2] arm64: speed up __arch_copy_from_user() for large copies
Date: Mon, 16 Nov 2026 19:13:52 +0800
Message-ID: <20261116111352.2006064-1-xiqi5703@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d0e24622-fbf1-484b-81c8-4e5d945e808d@huawei.com>
References: <d0e24622-fbf1-484b-81c8-4e5d945e808d@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgCHjZnc5vpqFGb6GA--.31639S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnKsjDUUUU
X-CM-SenderInfo: 50ltxkqxqtqiywtou0bp/xtbC7gBLgWr65uCUrwAA3J
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_032024_829665_71BBD99E 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Catalin,

Thanks for the previous review. v4 is posted here: 
https://lore.kernel.org/all/20261116072512.1323883-1-xiqi5703@163.com/


The issue you raised is addressed: PAN is toggled only around
the new fast path, so LDTR/STTR remain the default for every other copy
and keep protecting against user-controlled kernel accesses.  Fault
handling is fixed as well - every load in the 64-byte loop has its own
exception table entry, so a fault in the middle returns the exact number
of bytes not copied - and there is no new CONFIG option, command line
parameter or cpucap.

Thanks,
Qi


