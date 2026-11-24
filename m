Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79052606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bNYGMTmC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=XiRUSJh5;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lLrpdG3Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=53M/jNU7gvao9zbUz+MPtUuoMg3rbooohKcY2RF1rFE=; b=bNYGMTmCzF/APZ
	DvG6FbF6iLk4YmXGQOIkqF+vHUoHxBF6dyeo07ZnW+kPeU/vbqERVc7pxETEmWUal4KDMN0gSvfEI
	Q/4eL3ZD3VMicNDDd0iA6yRhx/Y3MTxfkXez2grqknVDi9VwRH9+sWwwXF4gaSEOMMajByrp/Ddkh
	3HGRNf8xiSulqt+nJRiCrCUcesxio1JrU4pbsP+bxcUJQFhddP7umoT1zwqAuJrr8iIJXjRitVVbU
	q3vyevI1onwNYvsMcdKAVWuu4UApqPzVMGL5V+r0Qqzx9iojTrVvxE3/4g047DpTLC3iSA+WI9Xhe
	RN0n+WRqsfimpcydbecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtdN-00000007A9j-3nZC;
	Tue, 24 Nov 2026 16:44:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtdM-00000007A6Q-1ZkQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=53M/jNU7gvao9zbUz+MPtUuoMg3rbooohKcY2RF1rFE=; b=XiRUSJh5PcwBqX/pYYAmlnEZ9V
	9cwtvHlYMIXgRWwNukncbnKjNGNigtcnUq6b51Nn5h3XKahSFP+MqQBqj/+sB2U8ZiGq6EXPfgRD9
	HAU41b+BpnOhaD1YtRO2b4RRBz9y+LbfBZXMzv+w2PmOJkB6g4JNfLl6fPUJtY0PpVfj3i6j3uk9J
	Fk3QDAu/OWZQaIw/agbqN+kdccnhxE+fb7Fcr0zClmddqwUNOmAYB9omAq7avLZu7YjuW2qxUwzN0
	fUsQ2BVldCIMSpJfjoEozE0s1D2U1KM64KX6N7j6mQnwLd8lvD/PJs9SAg6vzT78El0I3nQGXkqrC
	uOL49kbQ==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtdD-00000009CiF-3yK9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:44:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 49AACC2C65F;
	Tue, 24 Nov 2026 16:44:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA401601E1;
	Tue, 24 Nov 2026 16:44:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5BD011E69A74;
	Tue, 24 Nov 2026 17:44:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795538666; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=53M/jNU7gvao9zbUz+MPtUuoMg3rbooohKcY2RF1rFE=;
	b=lLrpdG3YSYonKsqjZ0nA4v/luC/lUV71hkWM0DMSi1Ut0YO3tpa3cvoqynxNCaoMzUu59p
	XibZaxK6u94QFBrZOu94Dvi2gNXxAZ4gTtAVdvriNTG/55I7Pqy1NrDfxCX+WIkOSzmX6f
	ScdRBDRkFB7dYJU4SutHy0rRYSABMxX8JeyMNWwId/jrOufL/rdbuszoslllhDDBeFxah0
	ZbLayFiNzZNjTcJKomgKeB4uwH+D559Jt4Goj5tjp6oHx0Y3MClE/5WbPg02Q5FyuPpb0N
	lL8Q+pAeGEjfDpE3g7RH0OhB3qY+KGGoRzjTfr4Mv136UL3b1tigVv4EOix67Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung
 <schung@nuvoton.com>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Richard Cochran
 <richardcochran@gmail.com>,  Arnd Bergmann <arnd@arndb.de>,  Brian Masney
 <bmasney+clk@redhat.com>,  Jerome Brunet <jbrunet+clk@baylibre.com>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Avi Fishman <avifishman70@gmail.com>,
  Tomer Maimon <tmaimon77@gmail.com>,  Tali Perry <tali.perry1@gmail.com>,
  Patrick Venture <venture@google.com>,  Nancy Yuen <yuenn@google.com>,
  Benjamin Fair <benjaminfair@google.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Krzysztof Kozlowski <krzk@kernel.org>,
  devicetree@vger.kernel.org,  openbmc@lists.ozlabs.org,
  stable@vger.kernel.org
Subject: Re: [PATCH v12 02/10] clk: nuvoton: ma35d1: Use clk_hw pointers as
 mux parents
In-Reply-To: <179519171774.3795820.3637822831411003847.b4-review@b4> (Jerome
	Brunet's message of "Fri, 20 Nov 2026 17:21:57 +0100")
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
	<20261118-perso-ma35d1-upstream-clk-v12-2-bee2c8dad4e1@bootlin.com>
	<179519171774.3795820.3637822831411003847.b4-review@b4>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 24 Nov 2026 17:44:16 +0100
Message-ID: <87y0aiqivz.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_164436_047660_C91EEF47 
X-CRM114-Status: UNSURE (   9.07  )
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

Hi Jerome,

>>  static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *na=
me,
>>  				     void __iomem *reg, u8 shift, u8 width,
>> -				     const struct clk_parent_data *pdata,
>> -				     int num_pdata)
>> +				     struct clk_hw **hws,
>> +				     const int *parent_idx, int num_parents)
>>  {
>> -	return clk_hw_register_mux_parent_data(dev, name, pdata, num_pdata,
>> -					       CLK_SET_RATE_NO_REPARENT, reg, shift,
>> -					       width, 0, &ma35d1_lock);
>> +	const struct clk_hw *parent_hws[MA35D1_MUX_MAX_PARENTS] =3D {};
>
>
> It works but a little check to make sure we do not overflow the table here
> would be nice.

That's maybe a bit more future-proof so I'll add it, but at the moment
I believe this is almost dead code since every caller passes a static
ARRAY_SIZE(). But not a blocker for me, will be added to v13.

Thanks,
Miqu=C3=A8l

