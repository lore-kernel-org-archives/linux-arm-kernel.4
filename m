Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F12C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sb5br7/h;
	dkim=temperror header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Q/+hLAi9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=prHiXuru41hVkUX5fnZU03et/s/IGkiTy36rSJ7ufsI=; b=Sb5br7/h8HEZb7xRbOXToaBYDU
	3k4yiZW7Mg4RiY/Ia7HIdL+kLgmU9ITzreE6tKfahtkTHV4/VlWziTbMS4yM3xPyJbBNKPJE1k7Bx
	lMIz/L9Lx6AY7r/S1T5yIPuCfz/OTySNP6eJqHMror5X68lLQqRn/n1pVRrbT5qPhlVe/znkIDSAu
	FOkqpdaSLNMVILcfYGUcSfLs6mQlBrB821E59cRb9P/jN0a0Dd7qXfDuoZAbyF34zqMln+P8CX2qG
	um3kiVxRHuTgtvRfvPuT2i+5l2giItXyjOK4G3EIf+W3YqeU22fzdiZRDVPuWN9AL8+l79FllL2YE
	u7q1ZB7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQT7t-00000001L2f-2Qc5;
	Mon, 09 Nov 2026 17:25:49 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQT7q-00000001L1G-0VLd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=prHi
	Xuru41hVkUX5fnZU03et/s/IGkiTy36rSJ7ufsI=; b=Q/+hLAi9A/0VV+uNQhBK
	n0bPmntU30t/U0COCCzqZMSC/rlitJlFKFG2SXYrHqU2jgKsxlQtfWCyKxcJWE4Y
	xu7Qggw59mp+WLvm05LwlnsjtYRrSBqftBr2jTOc0/K61EE4ioRHaLW+XTajzU2Y
	5IXRaBlZ5AwdKluqquJXc7jQ0ry7UJaQjmSPgZM32XTgaNDV9+NwqroM6qumwaIV
	7z3V4nj5vsV//4dbfA6MLR6b7odTv6kTRlPnqArBBNv2aBrrbLJlBMt0lPJaXVpF
	hagmWLe0TN8ZNMx+SpwOBTPP8tsOsMs4IkdwEKSs0D+4QECy+QnKJGTDz49y2OXH
	Bg==
Received: (qmail 3345140 invoked from network); 9 Nov 2026 18:25:42 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Nov 2026 18:25:42 +0100
X-UD-Smtp-Session: l3s3148p1@xY5UQNtf4OUujntg
Date: Mon, 9 Nov 2026 18:25:40 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Andrea Gallo <andrea.gallo@stericsson.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] i2c: nomadik: handle pm_runtime errors
Message-ID: <avICFAh07d7XrAIY@shikoro>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
 <20261103-i2c-nomadik-fixes-v1-6-655c6af2cb70@mobileye.com>
 <avFwLctRcnJHtINQ@ninjato>
 <avFzEaxgam-UuZH0@ninjato>
 <20261109100606.493ca48095bcc3527be18573@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109100606.493ca48095bcc3527be18573@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_092547_031534_61E6A484 
X-CRM114-Status: UNSURE (   7.43  )
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


> This solves both the positive return code issue and the usage counter leak.
> 
> Do you agree?

Having a leak less and cleaner code? Yes, I am sold :)


