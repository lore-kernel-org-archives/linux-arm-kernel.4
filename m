Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3D760A2607
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 07:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t6f6al07;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jpaswRm9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Kec65nPuayZJIdLamceFeb78dl+Li2+/4Nk8tZLJLo4=; b=t6f6al071NOnVf
	2pN0sflcEQu1RJYFoGIczhQxXvbpl3Vn/1/2h0WaCEQHrjPiUzwxpWKP2WCFnU8QEBDM6CH6lZq6h
	Z3YL8GB2CkKEOEQ7H7rRU8PiVqaD/8IgiogCsKzReNS6mM1CwzTysicYzGkr3zcoXSvRn/3tKjG4o
	gEXJx1Xv9IGsTCR+uSOoEefG61mantlm3ozuJYSt+dqD7QJCuAmAHVifEIYa43Klr24wur85cu6/X
	QDoX7yyW2HShfL+kVKLped8oYTwmKt7tRx7E2f5cBncqDdT3BmVJjY22hFL4kwAVuYy53CK3raZIW
	8xrtEhMvAbU0F50LWN1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJ9R-0000000EFeh-1jO1;
	Fri, 20 Nov 2026 07:35:17 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJ9L-0000000EFdB-45pK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 07:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jpaswRm9sWgP5G2bbC4Y0YN9Q90tOhB07cIN7rZW1NhieFDYMCQ9kIxha/yG4oUzJNnLvXu8mH12E
	 h9RZth6WNI7ChB27YoKz3m5tsN/CUesLSFIIlZ610gQd0R7PfCwa2KqUya9jusWuo9piaop+mFSW1J
	 tTfUA4Loagwara58=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26afff822b13-62144;
	Fri, 20 Nov 2026 15:35:02 +0800 (CST)
X-RM-TRANSID: 2ee26afff822b13-62144
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afff824879-1b755;
	Fri, 20 Nov 2026 15:35:01 +0800 (CST)
X-RM-TRANSID: 2ee66afff824879-1b755
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: vkoul@kernel.org
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	amelie.delaunay@foss.st.com,
	Frank.Li@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: stm32-mdma: Fix runtime PM reference leak in pm_suspend()
Date: Fri, 20 Nov 2026 15:34:59 +0800
Message-ID: <20261120073500.333-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261102104432.873-1-laixiangwu@cmss.chinamobile.com>
References: <20261102104432.873-1-laixiangwu@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_233513_746842_755CE35D 
X-CRM114-Status: UNSURE (   6.60  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vinod,

gentle ping on this patch:

  [PATCH] dmaengine: stm32-mdma: Fix runtime PM reference leak in pm_suspend()
  https://lore.kernel.org/r/20261102104432.873-1-laixiangwu@cmss.chinamobile.com

stm32_mdma_pm_suspend() takes a runtime PM reference with
pm_runtime_resume_and_get() and returns -EBUSY without dropping it when
a channel is still enabled, so each aborted suspend leaks one
reference.  The patch adds the missing pm_runtime_put_sync() on the
-EBUSY path.

The patch carries both Reviewed-by tags since early November:

  Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
  Reviewed-by: Frank Li <Frank.Li@kernel.org>

The sibling fix for stm32-dma is pending on the same topic as well
(Reviewed-by: Amelie Delaunay and Frank Li):

  [PATCH] dmaengine: stm32-dma: Fix runtime PM reference leak in pm_suspend()
  https://lore.kernel.org/r/20261102104108.794-1-laixiangwu@cmss.chinamobile.com

Could these two be queued for the next merge window?

Thanks,
Xiangwu Lai



