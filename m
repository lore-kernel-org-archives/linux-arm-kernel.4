Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5460C606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PZiOmxGF;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=iv63CrR+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KXTKxpvQmG4qWI9EEs3gz14VI5DReG+qhWlAxe45/Nc=; b=PZiOmxGFSLilf6h3kYtV9oeRAc
	hKqmFE+Pj9gvDiJFH5b+/M7Zkh3jfG9ryFc36LoQwqiOP1EzKb83mOe7YVEShzAesXADlkqZ48P8I
	gDxepiApCMCIVtj194y6OsKo+UQ0ig4teTuZaCyOa18+FoDqnt1ZzQyv+WKKfp39duNMSxBL1gbiX
	MgWFJ4FFlMLsOW9JS+ZdtsvFTTSOuPq1atzjzlqsVbRG+6LL12ZnSI/iV2wg+6lltXuUS0oCCBGSN
	7nltVHB/4NoHZKG3jOakMFKVncIpFJyekfHzcNIqsIwE0JIPKMI7D5Iit8Lg5Q+tHUTRx2Nc/sz5b
	FBJANICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQW8v-00000001fXq-3t5K;
	Mon, 09 Nov 2026 20:39:05 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQW8s-00000001fWr-2P4o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 20:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KXTK
	xpvQmG4qWI9EEs3gz14VI5DReG+qhWlAxe45/Nc=; b=iv63CrR+NkxkquUtgPAq
	xEKCX7A9CKbbZWNdTu2lcZahuFZDtMGnqQQ74Y5qcP5fyoa0paj0o/gfo0jeMsZ6
	PUhWd1+03dTf4bDg/7g13tuVG0PJyP69YOLSYVc6vscb0Esftjgpico9K2F0e2xU
	gvPI1j2AzUtP8sFgOGxN5+wrZK9aRo7OODlLLtmbTavBpp4cc+f3ayz56AjDrTM7
	aIr0jOIJewj/VJVAAKUhDiEPrqOdvMOCfJ5VhEGGkSH+TSBpt13R0IfL+HDHvTnx
	8+eFb37xTHxQT6+/hxTCIVsdO15/jY1Sm9fqCbGQtGVpZU1gjvbCe1rBSfuvlv6E
	QQ==
Received: (qmail 3406806 invoked from network); 9 Nov 2026 21:38:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Nov 2026 21:38:58 +0100
X-UD-Smtp-Session: l3s3148p1@1JSC891fWJ0ujntg
Date: Mon, 9 Nov 2026 21:38:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Andrea Gallo <andrea.gallo@stericsson.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] i2c: nomadik: handle pm_runtime errors
Message-ID: <avIvYMDqQtyBVIWI@ninjato>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
 <20261103-i2c-nomadik-fixes-v1-6-655c6af2cb70@mobileye.com>
 <avFwLctRcnJHtINQ@ninjato>
 <avFzEaxgam-UuZH0@ninjato>
 <20261109100606.493ca48095bcc3527be18573@mobileye.com>
 <avICFAh07d7XrAIY@shikoro>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avICFAh07d7XrAIY@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_123903_502122_5136E926 
X-CRM114-Status: UNSURE (   7.41  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> Having a leak less and cleaner code? Yes, I am sold :)

Can you please resend an updated patch? The code change is easy for a
rebase but the commit message needs to be rewritten completely which
calls for a new version of the patch, I'd think.


