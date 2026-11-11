Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B8260A2601
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0eS6s1Fi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t8WHPWqj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kxkRXuYhMPK0C30vvCMKN0f/tz8st3ZMYqyTNqjHyuc=; b=0eS6s1Fip8PywYOfVzEkpi3Xu2
	6WChPt7Gyi7TQrpX4GEAGky5e5eqJ4XSpM6eI73xDCuNPTK64NHmiQKOiCWRHRl/lpbzovOm66s+X
	5HxWtveTtC4yHdEexFtgOVVRE5Bw07GJJg4MUhzvFH9ZLpCKRhcq2IN1X4+goC7BQbDQhHR6xrSl+
	N4wNN+iUCVDTKIfn0pivEcCfDWrtpe2yZIgJcB0OcXPHMP1dcnRfGzo+y6LRNDR7U6aMTy2GMmPZU
	CuRTIVi7clPSG+SBIxsV/1kecGaG1aBJmVEGXATt7seFL+PcAKQBQMGRCEEHA38+xABD9UnOmdRYo
	o/dqaGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Px-000000068ai-3UqU;
	Wed, 11 Nov 2026 09:14:57 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Pv-000000068aJ-1Xwz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 09:14:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so26557345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 01:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794388493; x=1794993293; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kxkRXuYhMPK0C30vvCMKN0f/tz8st3ZMYqyTNqjHyuc=;
        b=t8WHPWqj6YnH0xnYn30XvCoCqEb4CxzVJRxqYQFZ1GGNsZZqNe5Rz/oeM7nLpfChDG
         H7fR8ifDcT4HjQYR80dsia5JruuQv1b1uzbV75ocTZ08n0Jh4/rMUKT/0grOvR+5nVdJ
         smDk2TdHETYjYI7r7UQnEcPPZ/FUwbnGdpIkx0/QUpcQrTIG68PoaGFGiHM1fIcefNPr
         gRDMZInuiWeuEYYxgKqgIjJQXzK+a2+EQIjOGxrLWLLadoCPhctSMAHRDnHMgk9KQHg0
         3Q9unvSm02Ay++RDW+2Ho32OcMac0SotxES0UfGXwBMBMKxwtt0O2whqCcdiGRhd7lyx
         9WFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794388493; x=1794993293;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxkRXuYhMPK0C30vvCMKN0f/tz8st3ZMYqyTNqjHyuc=;
        b=ngHVw8bj4BqpX+GVpIbegXxvrnEoJ4jfvYT2zqX5ZB0VYGbhYEostD5JEtwa9Dr4C+
         7syGMKfm07HSMkGf7Uqqgq+Q+mR0KmTcMlt5r/KQ8+rxf09Zm98ukkHwY/z15p9por8p
         2h1wdD8J0lO4reTQAkvOMYE/qX4YQ3nTo43abDOYqJECmV5ABIx9Hvf/pNLjk47YIYuZ
         3MDEZZoBS25w4sGmmWCpyF01+m8N1ptoX4KfGTAkDVjSC/NGSpoFgkozEuzhfZJ6Aqd7
         7APJLCteR7pvijzZ7NZzPYDdtK28HA4rNnzGXjJasDgDzw55vjPeXHsLpoptDuC9vdo5
         gwlw==
X-Forwarded-Encrypted: i=1; AL+hErEftncDigXO8NiK44xhIjK0PQfQz67P8LC/Sgxyy18XlUWknd3Oy1Pu7ReXSJNV1Ui4X0+hbpXPEjKzob/uI5eq@lists.infradead.org
X-Gm-Message-State: APuU4Z9XNIKnLLvsFQbO98yE6V/oWs2oJt5w1hf/eYGW9Pkq3L/ajUvL
	LZgYbb3xJ7Nr7NGyYNqx1cRkqbjlFc8/MnMTmjGzUB82F5gh5cP7zSUv
X-Gm-Gg: AYBFou1iUXKiEdsCYNIU4wUOFTG+JtcG/xd2mm/KJtPIdttBNWKCvaN8eWbnF6ZYo0r
	GtU2SsekrnSg3rJgXS5ZMVGCeE7WL6w0yQyRShp11nRz0AiGn0b8SlCcbyxXaT1Tt1RzxtDZDeu
	K33qh+u7aPWeTOkap3wMNcN0SfGrnhgAkZ6qCvsOKOHKEXcAL7VNgPc9qzMexCNfxRqZEzz/ywx
	XSl1IXW8MPQSdLrYTmRQF6N1uijRBrlpJYM7ZxTJpuF8PwEBxLlygfY4EJ54g9174oJ45e+iGvd
	tax5V0QBTl3XrViR0fe9CyCSXGA0orX7IGSnej4bv9vqNmcdaev7q93o5tmk6DcGPBNvIT6uEO5
	DCwDzTqc0gGERwMWqTq98T0ivoYrWHy3ApLJah6fMUTIfeiCcdl2IYnlS4gWlNTR1jlomgr9Y8n
	0/KkxrL5t/pdA78EY2kLbI1WpCXec+3On+enAzDOASjtHdjcjrN6FDN9SscelP6r6RoxKJI/1yN
	hIuzOxwOYa0IX7s0NzaZp2z4CYr3A0VZvR68IBZhDPgPj1bnXWKkFN+amvcbpZb4DieLV951B5N
	LHBcqgoqyHFSx96RPThLHcRDZdmz8ATzEQ9IvOQSH3fG27JmSYX/Wv/UmyHvxvlkiGWk8o8Xd13
	Y8S3eHB+rWc28OpCn0PdzL8DSb8OZrGzFBAF5OhSeYX0HUMPFXybmOBeiwV55JQ==
X-Received: by 2002:a05:600c:6994:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4ba0935bd68mr32873845e9.4.1794388492912;
        Wed, 11 Nov 2026 01:14:52 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02005946sm145501635e9.1.2026.11.11.01.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:14:52 -0800 (PST)
Date: Wed, 11 Nov 2026 10:14:50 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Frank Li <Frank.li@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com, Nate.D@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet
 LEDs to carrier boards
Message-ID: <avQyCgitN-stXoS7@Lord-Beerus.station>
References: <20261105101739.10614-1-stefano.r@variscite.com>
 <auy-OW_td7N8oHK_@SMW015318>
 <auzAh7404GAsY-U0@Lord-Beerus.station>
 <9c416362-4e28-4327-b8c3-bd789d2922f0@lunn.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c416362-4e28-4327-b8c3-bd789d2922f0@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_011455_420403_8B4ACE86 
X-CRM114-Status: GOOD (  10.64  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 03:03:12AM +0100, Andrew Lunn wrote:
> > 2. The Ethernet connectors, LEDs and their wiring are on the carrier.
> 
> The PHY itself is on the Module?
> 
>     Andrew

Hi Andrew,

Yes, the PHYs whose LED configurations I'm moving are physically
located on the SOM.

I'm moving them following the approach we previously discussed here:

https://lore.kernel.org/all/31f30651-7c99-42cb-9e27-e4806529d137@lunn.ch/

https://lore.kernel.org/all/fac81a12-92c9-4e29-96ca-473c18fca675@lunn.ch/

Best Regards,
Stefano

