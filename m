Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAFF606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 06:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PcmHts7O;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=kbKf4zdn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Pr/L5UIhdSBgIIxRY4ACmBWKTwcC0Vu48k0+5gmsT6M=; b=PcmHts7OHQ3/tD
	ZRKms4hrOKkq5VHL+TTVGqs2pT/wXOFwkTAGL/i2RSfNWDEMW2cPbvMos1v89OeR1jQIcLFtUZjT/
	hgPaYQalrXjoek688qaQb67ho0n7gEcDd3IAJnYp1nnEQlDWs/6zlAMtOvY/aKctweCAih5H/6Uzq
	arBYVqH1krgM9tBK4GvQr1V9gShcWBmE4cOFHJk1vGMbkcRSQA53G9NytTHeEkO9hiSQFU/gkXEF+
	Y5p8opu6MDg6nPKU0Bot0Uzdcf2sNxMZqaGmoSSL3L2B+YpA48QBaKNLrHuLEkdZ6yj7sS+WCLgMD
	mCfV/6zAIyzyuVj9WMMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUICS-0000000EA1a-3Tg1;
	Fri, 20 Nov 2026 06:34:20 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUICP-0000000EA0P-0C0d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 06:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=kbKf4zdnWgA0yU/eStLMFCJJlBuQlwxbM+DAkzoM7eK0jGWCblsAY/V2Aun3U1TxASu+t2Lz9Rmoc
	 j+ZywrVn530sZV8MV7anHRrVBT7kqCmk74hFV7qaezea/K1PnSGxJ2zFyVvwPfLt8DadI5ivLSQFyA
	 qIym8v969OyyttP4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66affe9dd8b2-f1be4;
	Fri, 20 Nov 2026 14:34:05 +0800 (CST)
X-RM-TRANSID: 2ee66affe9dd8b2-f1be4
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16affe9dad6e-18c1f;
	Fri, 20 Nov 2026 14:34:04 +0800 (CST)
X-RM-TRANSID: 2ee16affe9dad6e-18c1f
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: antonio.borneo@foss.st.com
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	linusw@kernel.org,
	krzk@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() error paths
Date: Fri, 20 Nov 2026 14:34:02 +0800
Message-ID: <20261120063402.788-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <2a6ea91480a6c002a7354ce1223c1d904891371f.camel@foss.st.com>
References: <2a6ea91480a6c002a7354ce1223c1d904891371f.camel@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_223417_661868_78102780 
X-CRM114-Status: GOOD (  15.42  )
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

Hi Antonio,

Thanks for the historical context.  For the record, this is about:

  [PATCH v3] pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() error paths
  https://lore.kernel.org/r/20261116031043.502-1-laixiangwu@cmss.chinamobile.com

On Thu, Nov 19, 2026 at 07:27:19PM +0100, Antonio Borneo wrote:
> The driver's "resets" property is not currently used by any upstream DT.
> Using it is also problematic, as asserting the reset affects all GPIOs in
> the bank, including those already configured by the bootloader or secure
> world. The current driver uses this only to deassert the reset during
> probe.

Thanks for the background -- I had a look and could not find any in-tree
user of the property either: the only rstc use sites in the driver are
the of_reset_control_get_exclusive() in the probe bank loop and the
deassert at probe time.

> This patch has the "Fixes:" tag. Whatever the evolution of this thread,
> I think this patch should be taken for backport in stable then,
> eventually, followed by the "resets" removal.

That order makes sense to me as well: fix the leak first and let it
reach stable, with the "resets" property removal as a follow-up cleanup.
The patch is ready as-is (v3 above); no further changes are planned from
my side, so it can be picked up whenever convenient.

Thanks to both of you for the review.

Best regards,
Xiangwu Lai



