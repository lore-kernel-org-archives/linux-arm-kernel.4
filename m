Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A039F606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 22:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ve1Q0KcG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V838bW15
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fAkJfhA1e625VlHi6/CjskjkxYNTufG3gb4nVL5CjEE=; b=Ve1Q0KcGrwRdro
	qL127WxpLBeXJ+H/sx4To7NZOnYVnD29aWlwELg5clSN0/1cE/UVhokekT12TWHanHAOupoZ83mYs
	S1X14C6N5bXRwOEkVc/vtBJTrskRNACfugHDFHnX8N0UHvPfax6seaYDlYRznJGq9OkrBcrkMXzlF
	p6o34RP/YZD8a9hEWSBKHxdX61rzUf3h+ocD2r34bEeikJR203lfca+MptGoyrmEFP/O20G517Y3J
	nAk5qFCrEspM0SkIPREBAOTAyZJGwP3sH7AFSD8rkRgZ3GLiCeP/UZ/PZiHUSSORgZiyJEhaKx+on
	aUHRl0bhmX5qyzEArasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLvA-0000000BWTm-1GoX;
	Wed, 25 Nov 2026 22:57:00 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLv6-0000000BWTD-0rUQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 22:56:58 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso3950414f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 14:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795647414; x=1796252214; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAkJfhA1e625VlHi6/CjskjkxYNTufG3gb4nVL5CjEE=;
        b=V838bW1568xwXUi5mYSVpYo3rdWSNeMaankJbHVzzgjX/7aqz8mZH4T/xcYJ3CGHs/
         2FWNFsWD6ySJiExccFcww5RX+btwGYB0KnzjTA4OrfU+MnGjuPd2v9xyaRLoopmUizsy
         nHGkFD7FaOiaUfNvK8BuEiUCP4iTBxo9r7hJZemBFL/3MqD9w2xr1Mgbo2b4uU3kJpFr
         fb3CSBi3MqUXpVs5/RTZQ6+PmxVo/oJK9QXjoT3kga1Fy96WCVaOV1PQU0xdroDCN67j
         WOV4z/1eL9H61Y8x1ELP+hU25ovjMzAluY4EONSweS96tDUtCS1K/44hqo1eABISgyvB
         0bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795647414; x=1796252214;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAkJfhA1e625VlHi6/CjskjkxYNTufG3gb4nVL5CjEE=;
        b=d2pJaudXrjmkanK2rhfDhVQ3GE37BIiAnQgoU0CoSKtOymR6LcANEfLE0+9Q1k5zqO
         sBI35nehrKN+U93016K4kcHeO2fWufa5adgilqFTRYLM1HEBCTfOm6I2kmopZ2bUe+kR
         nlQtVHTwpG4f2fP+wouxx/jttYzp09US0a3mGSMCXqUYQKAo7GoMXPkDFgA3XA6ppN2O
         Wq8UreHaKZ9wXhR5dR2GkQHd9KsU3qvLByuUus9v/ip5n1KwwWm5uGPOaxDQXJ37Cft6
         xxROk2EW+KeSBwbrwPxp+bPEaHsKwqgWhB9Ilqt73nksWucOhTDuLSMyIjWmwv7kKutW
         3UyQ==
X-Forwarded-Encrypted: i=1; AL+hErHxeSk+rYk/gJXVNFS1B+BWSiv3FcJK5MHZMA1txCwfHMzaWH/MhnDNUh40PNE08/h4m4glJ0GP+J1gt+ir78O9@lists.infradead.org
X-Gm-Message-State: APuU4Z/WgezRFlkaFKpoTcOBBiQmNT/wyNlEVf16KR/8sQUL8udT6yuq
	7nzW+3zdIJl0zitfaXjmEGHIrVJt4B1MTdhAHgR2G41RReYC5BzfOLZV
X-Gm-Gg: AZFdTZcQlo7Db0TNlfK1P1FwrsRh2qSDXsrsbwuONxHA+dqPtZ0vDCvUMquABjuQ0ne
	64turQ/n7J1gPGU/f7L83Eeilfi0YtfMVLXLlqsss0pfSHPWWvkmWbiv9lx2J/XXmFdQCeloyvW
	RAAmDhnxK2ccXkwHJT9sJYu5AZfu288O6V2UbV8ChFREKl1VoSIimwKSGeylR0LS/JSK8zvEnPj
	6EEXC5fJaQNsgpSMa7/CIK/NjQrEzzn8X/tFxtQ+UDhy6ePXehOrYUN7segMOHBSla7d1kq4Ex9
	p2CLukpBopUvQqK1CMuxff7gI93isUHzlOQNf8mnR7mfdFw+dl4guG4qxlo9/k68boYvfxiNOH3
	ZvYOPAMNEMGJBLpUOUJEuyHG5ZkUFbzv4cCVmA7tGLsF4d/h6grYlzGC3+tkOmKlwvTUi+SSaYY
	Bw7HbT581bQV6YoSiwWUD5/LvKYKDqsLWEHvZMPGfIKUC4wWbPdIvOH8kzUK4YKTbVhAl0zeeES
	JueICpTf3RLyGWMtE83//vGUnNUuoXX4ct9Q2kZQfyWXM9K1hrbJtzFaoHMrBo9w056SuT6KgjX
	tYxyr94ghP5P7E6STr26XTP37+lyoBS92XXo5hM3E9ki1F/2o6hhRO0=
X-Received: by 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr402625445e9.12.1795647414193;
        Wed, 25 Nov 2026 14:56:54 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm865695085e9.14.2026.11.25.14.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:56:53 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christian Marangi <ansuelsmth@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC net-next 0/7] net: cortina: CS7542 wired IPv4 hardware
 flowtable offload
In-Reply-To: <5e9d9808-3917-4706-889d-ae1c360155e3@lunn.ch>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
 <7252b836-e375-4550-90c9-b0e3ab7fbb6d@lunn.ch>
 <179564372798.5.10006827612276789857@gmail.com>
 <5e9d9808-3917-4706-889d-ae1c360155e3@lunn.ch>
Date: Thu, 26 Nov 2026 01:56:38 +0300
Message-ID: <179564739825.6.2717872099061772018@gmail.com>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_145657_575992_0677026D 
X-CRM114-Status: UNSURE (   7.11  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

Understood. I will focus on getting the basic Ethernet series reviewed
and ready first, and hold further offload RFC revisions until that
foundation is settled. Further offload development will stay local in
the meantime.

Thanks,
Fil


