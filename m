Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7FC606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 15:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OjGG1aJP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dj9FE5Ke
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=; b=OjGG1aJPiyUZHftaNSYkyrI26b
	AozUVxdeHfAMK7r8Z9jfr1d6w/+ZFZnpCqr97gvOMjbm4V4/w7WS5OqJ3j3OgV/N9r72foallTuVr
	NXV9KP4sXJqNQJQnEl3I3gl43vtNyC4nwcfs3OdesC0yqLSBP8wiYe+MhoUMGLqAyHz9/hGwN3Wtm
	fs79vY+hzDq7XnyY/N/G9llTxMJILuUL1T0gqeJ7UfVDKVgXsv7fg2wjABcmhnrbBmLD9gbE42BBA
	+f+t0CTYzZDRNCoHzZXvSm4w09yqX2SXxyA3EiXzW2gECI93grfrtDOmb2F/mrTNxkDh9Os3RPq7w
	BQbUerZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSytv-0000000377e-3JPu;
	Mon, 16 Nov 2026 15:45:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSytt-0000000376U-02wn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 15:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794843943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=;
	b=Dj9FE5KedxW0IF/nQT/h8NCoTTteH0GzC8kWon+duGFaxAHI5UPvqjuiiwzJLL3B718d5U
	zIpHU98gm/bDf0nHhvSgGcb8C/ppgOK9dlFvOusbQRxHaLpNIHiE40JCi+qfvvqaDeaCbv
	x1vxKxqcowOD2xxbeTRonnTFujs4gts=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-jRkWjz33MG-4KKADrpejZA-1; Mon, 16 Nov 2026 10:45:41 -0500
X-MC-Unique: jRkWjz33MG-4KKADrpejZA-1
X-Mimecast-MFC-AGG-ID: jRkWjz33MG-4KKADrpejZA_1794843941
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-948d83322f6so615356185a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 07:45:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843941; x=1795448741;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=;
        b=Fz1Md2YtbJdwHCWKdpfsotY+iAaJVwxQ3HCfTlskO42CErCEDvQ9hiCACbnAb/LGXR
         gWz5vSb91YNyhoeI2PJePS2i4GKrF/HlKnnA6p6nvxPMwVMd3WfsknQMqdQga9F5PaSt
         ZADR+moGdhXdLfM2rqk+5uye7PeP3AhHBwqNYPRrd940As14qdxK5WRGD8Po+Al7hger
         kPheaS5DkYufdAGHTR/kixK+i66rm9SaWqv2wuFuBtjkXS2W30sL4b/9Z8Y7NLVsBqT4
         t5gY7DkhfSDNaT4c1PVDHYzcVO6dPDMAIYpNv5Y1HYQzfuvYnYsSGvkoSxbRHHhun2Fo
         lEVA==
X-Forwarded-Encrypted: i=1; AL+hErFYrYlkyWz0ieT+2RbPeuUk/EfmBOsXf6OMsNvD35gZNrlBYS+vwKryEbSjheci75hyebLV8MGIhpg58jY0o8ve@lists.infradead.org
X-Gm-Message-State: APuU4Z9i3d4WZUF4Lq+MGcWWQGMV0OyckYY6y4pT+KLZlLORz60SYLf+
	URcWarnqeX24BYGwjHXb1lgql8Ct3UA2vMeGNZiAEMGCA/9PWyDIKNTbLwfSUS20iOrWwCkQqia
	E6m/RjMr0eloRFLnTED14uyZr3Z3n+6sMvJazlQXQQK0fbSYgN9qa0Js7Rr8kZGY49vGlIZqg4Y
	L2
X-Gm-Gg: AYBFou2x/COc1WLCKESoTel3wnZvlJ57N/uCeMggMaKGT1IkEkiqATzETDbEWBH0RK5
	P6UHpcJe0JQZ0MwS2WTD5lOULvXk2+JoGVRvtHGnnzcdO2y2kWbC0wGd520aMJHjKocmTOMsnjL
	ifgolOg4R6T9gfhdVWda0ycKDApSNYAQlMJNE5uejvAlpgTde6G0mthrNfquWpiNhMawAUDuJ3k
	tEJw/tuG0CiBqnx8YXshb+uTvv7c5jf3rf8sRjeLI6dpxUnIuvrEbXlBdeLl6kLRGxejbqc/1pp
	AHD6An8e7BpFHLHg8Fbf0putfKdJS0d3AM77jTD3okuSfW0O7EpkFy0/07qk0n7Cc0OIfVlI1PQ
	tUE65+QKLNsbNwKWrokX1gs1oC0+hHs/S37ricXST/Txx5oK1tRo3yby7On4WrAJHCRg/OOq13j
	KogK8sDQpuxqlZ1Fmnm9XLRoRExinit9JG0BGZG/Id
X-Received: by 2002:a05:620a:2805:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-9494bbdd1e6mr1849369585a.17.1794843940393;
        Mon, 16 Nov 2026 07:45:40 -0800 (PST)
X-Received: by 2002:a05:620a:2805:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-9494bbdd1e6mr1849341285a.17.1794843938440;
        Mon, 16 Nov 2026 07:45:38 -0800 (PST)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b889csm877596085a.32.2026.11.16.07.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:45:37 -0800 (PST)
Date: Mon, 16 Nov 2026 10:45:35 -0500
From: Brian Masney <bmasney@redhat.com>
To: zl020895 <zl020895@163.com>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Brian Masney <masneyb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Long Zhao <longzhao@ambarella.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Message-ID: <avslH10GRqkVT9fU@redhat.com>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
 <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
 <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
 <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
 <avMM8z-LYncKS8ip@x1g10>
 <avMmKJpczepWTRdc@ashevche-desk.local>
 <avReozTC_GEmfIxG@x1g10>
 <2b30e92.3c75.1a1e2828c3a.Coremail.zl020895@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2b30e92.3c75.1a1e2828c3a.Coremail.zl020895@163.com>
User-Agent: Mutt/2.4.3 (2026-10-09)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Uh6gIrxZqEUWQa9K6_y17DYQFjSyqqRkvwgLKS6F1EE_1794843941
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_074545_198022_8FE04EAB 
X-CRM114-Status: GOOD (  16.24  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Long (and Arnd/Krzysztof),

On Mon, Nov 16, 2026 at 11:59:28AM +0800, zl020895 wrote:
> At 2026-11-11 20:25:07, "Brian Masney" <masneyb@kernel.org> wrote:
> >So how about this:
> >
> >- Have Long post a new version that splits out the creation of the new
> >  Kconfig symbol ARCH_AMBARELLA into it's own patch. I assume Arnd could
> >  provide an ACK on this?
> >
> >- I create an immutable branch that contains that the two dt-binding
> >  patches, plus the ARCH_AMBARELLA Kconfig patch.
> 
> Just checking in -- there hasn't been further feedback from
> Arnd/Krzysztof on the plan yet.
> 
> Should I go ahead and prepare that split for v12, or hold
> off until Arnd/Krzysztof chime in?

I haven't heard back from Arnd/Krzysztof yet. How about wait 48 hours to
see if they respond, and if they don't respond within that timeframe,
then go ahead about post a v12 with the ARCH_AMBARELLA split out into
it's own patch. I think that's a good change to make anyways.

Brian


