Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80960606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ucmj7niX;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=iSLg7Ze4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UrgRuA4qIN8HYiSqMukKi9v17NzPiBhuFI6MYq6PyEA=; b=Ucmj7niXdRYwrAWGLkYpe4n5lm
	h6vkIOllaBMSWftltqHbpCQvC18VQEta6jjzZxQBL3DG5iik4wCSXm47brvZjksn9BNzx7e2YNu2h
	XxdkIyEFpo41r7J3mkU/t2BUilMmQhxoie3p+1zEziZvjHnpuMAYc1PEeZtX9FGPXaSvBpg53jR2r
	XYSA8YiGyOQ7/at6fcgnBNOpqUGx5aj5gVFlnFsXx4ufZk3xRSXUZFgqS5Ht07FKxIQMUmVWzC1Wi
	KxhkOQlXScZs1YMY5/TXgfOX0xUXtAxrko2VLtAMncK/0Q269MZR5oOfzaOJXD4rZIcLzh8hOMvZr
	Q6atgQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzxO-0000000FxIj-15P4;
	Sun, 08 Nov 2026 10:17:02 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzxK-0000000FxIM-1Mjj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 10:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=UrgR
	uA4qIN8HYiSqMukKi9v17NzPiBhuFI6MYq6PyEA=; b=iSLg7Ze4i8YhUgniD/xU
	PiEdi+qumx6BmJbCyrCDaKqmve1usIpJpojNOJaDxuj666kJmGdsM7OJgswSaNVM
	xEIedPFCRBHqysZZGQvl8wm7R/HRFCc1QqN+T61ICIOMNNbwTJqgvsBT6OvyKdPe
	7q5Zew4GGssjRwnOJK1R1khs4o91zACTkKRbWRhWXNr4Mom6MPVSeCr6VWxML2Xx
	/7iuehdxvj7P0MSX4ek5P/gU70Bmex8ZLAvaXFaz7uvq2VIH/+i0saMg/os80/aZ
	dH/+Af0dvEoEWKgfKAweA8ivsCPbzJr41ffK7mwQS2Hci1gbp9jL8IBdH2ZH8BBJ
	Zg==
Received: (qmail 2808041 invoked from network); 8 Nov 2026 11:16:54 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Nov 2026 11:16:54 +0100
X-UD-Smtp-Session: l3s3148p1@DHDJJMFfCLVe20rG
Date: Sun, 8 Nov 2026 11:16:48 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Andrea Gallo <andrea.gallo@stericsson.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] i2c: nomadik: fix several issues in fault handling,
 optimize layout
Message-ID: <avBMEGxmWtANGbZH@shikoro>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_021659_260954_52FB138A 
X-CRM114-Status: UNSURE (   7.67  )
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

Hi Dmitry,

> Patches #1..#5 were previously submitted as a part of a patchset that
> introduces detailed fault reporting feature in i2c-nomadik and
> i2c-designware drivers and i2c-core.

It was a good move to seperate these patches from the bigger series. I
trust Linus' review, fixed the minor issues, and applied it to my
for-andi breanch.

Happy hacking,

   Wolfram


