Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E8C606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=czUU00AC;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=NX0AFeRu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mV9swtsoL3o2EMx3J+Py97A7P4OjFHHdOEE2zPHNifo=; b=czUU00ACoj+X0W
	gCK/O6Zh5aoCAmfz1wT/rcI6worJQp/KvZzx7DWSg3OnEHUx5Pe33lyDMYhvWeqHXkQgJqvokyB0S
	TGU08NhK2DABt46D8nBPt7nCrBePiNgXRtVoEbTEPpsVPygTcHHQXDjDmMAwsK14/iQokkJIbc1vn
	NijDKEzvg7KXJm04Pmz9L7c4ONHvUhw0E7zjZC3JQHnpIskRZnWuIDP79rS0bNdWdAbjViyfijH4A
	6p1n7q6PWQFIsBk9GExpTi0KNRoLJq19L6m8QQln3KRIRrYy1AhWasV97ShPNrhNUBdPXxKavvO0X
	Cyna5wg+axxT1GJ7R2yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStOg-00000001qfD-3sA2;
	Mon, 16 Nov 2026 09:53:10 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStOZ-00000001qcz-3pS8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=NX0AFeRuBGf8xNILELAWCIgB8/+mUnQIrjXoiDyA5jHR8jfUeT+jIRVtoZ7wjs7NkMFaJsT2GpEDE
	 9DdHzmM/YGtTBkWdoZiMSyABSi2lSBzTsDBP+/DQ+T063Xv0fNjOA8Py2GXshQACA7ohSFOl+EOItH
	 oFeIajgECZNS7K6w=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36afad272b6d-cb7e6;
	Mon, 16 Nov 2026 17:52:51 +0800 (CST)
X-RM-TRANSID: 2ee36afad272b6d-cb7e6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16afad270b12-87bf5;
	Mon, 16 Nov 2026 17:52:51 +0800 (CST)
X-RM-TRANSID: 2ee16afad270b12-87bf5
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/imx/dcss: Fix clock leak on blkctl init failure
Date: Mon, 16 Nov 2026 17:52:49 +0800
Message-ID: <20261116095249.1519-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261030111304.2205-1-laixiangwu@cmss.chinamobile.com>
References: <20261030111304.2205-1-laixiangwu@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_015305_557537_A9C6E464 
X-CRM114-Status: UNSURE (   6.25  )
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

Hi Laurentiu,

gentle ping on this patch:

  drm/imx/dcss: Fix clock leak on blkctl init failure
  https://lore.kernel.org/all/20261030111304.2205-1-laixiangwu@cmss.chinamobile.com/

dcss_submodules_init() enables the five DCSS clocks before
initializing the submodules, but if the first submodule (blkctl)
fails to initialize it returns directly, leaving all clocks prepared
and enabled.  v2 jumps to err_clocks like the other error paths and
renames the labels to the err_<x> style you suggested; it carries
your Reviewed-by from Oct 30.

It does not seem to have landed in drm-misc yet - is there anything
else needed from my side to get it queued for the v7.5 merge window?

Best regards,
Xiangwu Lai



