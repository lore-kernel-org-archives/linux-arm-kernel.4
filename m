Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688D6606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 07:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3fXc0PnN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XCyHB1oM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F2bkFG7ZS7VXLjGlbW2rruMDJvKfO8Yi+927a5d5sqI=; b=3fXc0PnNwzoubh
	lG0B0Xdn5HS6EM8otjo25/guHNdRyLyY8nMOK+47kesWt36Ifc2XcAURMct+1IpuCuYiut8pEsdkt
	B6Csz5RaE+O6B8+rnB0m2SY86gVEexQuxnkw8obRlWLDmv7g1KtNu7o9bvk6KxwMvmsjDqLJybj1D
	LDtIA90zfaYNYI8Eg+6tDBpUWv7B152RZZ5UMpdFeVDDMiDP73ujgIua1tjXE2FbbXOuk6WRBKJiJ
	UnKqwd2XUMBkF4KG68KTuWmVwzyDuIbAG7nNmxP5h6x3zEUHYd2YYc/zGInX6M4t+7NncjRBhf99E
	HNom69yw8eM5lhlUi+Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkWA-00000005hQ1-1PF4;
	Tue, 24 Nov 2026 07:00:42 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkW3-00000005hNY-45Gu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:00:38 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5c126f80426so4163851e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 23:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503634; x=1796108434; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F2bkFG7ZS7VXLjGlbW2rruMDJvKfO8Yi+927a5d5sqI=;
        b=XCyHB1oMaZUEoynkB7X6/Fbn/CjrbtNgbh1oUTnh/SCiOvmp/vvaVsTXEYBA1xMjtt
         xSUj4LoNxiRwHBNXBo9aBCtOv3JJbToDGgDYz+iuO0fJy6peHH94W0y9mb80bJDH1pWy
         KFRR3Hcs2orfBPzfrLRl6ptUJoTNpKjWinyP3bMvo7pXINwiSc/wltdQGXrdlhovSVLO
         yLdA6/8lI+spMdzLuDUomThgaX6X7FlXj+jiBVkI6sHW4pMmu6FoNjh8FXB5HWWKxOEf
         vTCCprfNts4jV5I+x43EglA0+2c9b1UXf9k66Uc3w5EvmILmHLQNCbtYNg/0vo8rXiNI
         KVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503634; x=1796108434;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2bkFG7ZS7VXLjGlbW2rruMDJvKfO8Yi+927a5d5sqI=;
        b=AIfhVaL2uYtQmOPQxTS+utxxUlFMbVxM+bl5/61nPjp4Rey7+JuZuylIvoRYaa3Qu7
         Ixmy1EtqK/cQS1X8NcdrmN2zXuX6MP8wT9wlEDPZcnOZoVujHK/LUwolYJzjeBLAHgsC
         NF/PzvC1/GFz45WiuM/v2ledCzs7UXEQ3di1B42zkZd8CPQT2KTbW2CXuu46bFFEf87l
         Kd4yw4xLUYbs1pQA5uWHOIWwL17DOjx6VS8qrrZIOSXyJcF4IvTYgcKZSQeKseiaNFgx
         DuITYMpDXsEbxd8/mT267ObjonlzUlXQO4U9MQc08duSJCfdGjKJhLR+gbAM6Ham9taZ
         VuLQ==
X-Forwarded-Encrypted: i=1; AL+hErGLY3xPenDfHCO1WewJhMteZNn7yFR8vXUmkQDFQfElHconTTXrqxDU8O56g1akKIzwHlzF4tKzhwdhNUe4bHiZ@lists.infradead.org
X-Gm-Message-State: APuU4Z8bKPaB+wmkK88J2yrfM2MPb0yvtNEhCM4IGfPtoTAPFSBqWoU1
	rbZVT07zfpT4nRvHpuqSbtoxuoWzWNUg8Ai2aE5il3iIbJyDXrXVNzdO
X-Gm-Gg: AZFdTZcZ14ybYy3V2/bIGbjgLeE75B1r/E/CWhgIDfbXzl53mVdAUuA704ZxS2uUnYK
	DH4YfzQkp9+Zc2RE1sQ8sIBJejCdYUb9S/QzWnlpv8TL9wYDfvtirmTCb7vc0Vo4novfZLNkMMs
	R3XVqPa+PHKFYcojaTYkmxftHec7gd+Xf+OT3mKUcxdEtVYaHt92FCm35Q8vXOCD08LmCvGrC42
	a1OmRqFqcv5RiGSW0gGqAgj8BQBjHUxf6fT+oZ24zbIktueN9xe4NHQr5z67qrPzw+EdxNSZvXP
	FJeyeZLmMUYCoc8WaQhd86VU9kWNX/HKaT9oAH3bnd5uqMobbgLvOp81vzTVV7QlmwIz6PTrV1V
	oWLuiMjIYHUaJU4ziEN5GXvDzKyNbR6xs53g5H45A3sl6e/vo2PhborayIPQhS4KjLDEQMgN+YD
	GviLqUcD1A9Ne1tv8RCSiu3Fg1mKJs1qOfIes9/rfpb/MsEIZVtKRSg9ZhfqToo7EZUAe4XhvNP
	VmQU6NZ6NwldWyf13nDb2BK5QiHqUayzUyWQjfqhvnceV/KeQ0ZVww8CXa9GIXxpEMZKE1yCri5
	/Dq0iR+yzZxSfjuB0gH8rDW4GxM9d68TD/KyX8z0VwynK/r4SsE54mRiuaBFr0zmohc0qJFi5Ll
	I
X-Received: by 2002:a05:6512:1394:b0:5bf:d004:a84d with SMTP id 2adb3069b0e04-5c1bc6d11ebmr3582097e87.5.1795503633589;
        Mon, 23 Nov 2026 23:00:33 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf33312sm3554315e87.4.2026.11.23.23.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:00:32 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/5] dt-bindings: reset: Add Cortina CS7542
 network engine reset domain
In-Reply-To: <eacbc1ca-d12f-45f7-804e-2c7454d97eaa@kernel.org>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-1-fdb5e8c2d508@gmail.com>
 <eacbc1ca-d12f-45f7-804e-2c7454d97eaa@kernel.org>
Date: Tue, 24 Nov 2026 09:58:48 +0300
Message-ID: <179550352891.6.12053051010700273859@gmail.com>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_230037_059506_42B4B8AE 
X-CRM114-Status: UNSURE (   6.57  )
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

Hi Krzysztof,

Agreed. The shared-global follow-up moves this reset into the parent
syscon provider, together with the PCIe gates and resets:

https://lore.kernel.org/all/20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com/

The prepared Ethernet revision removes the resource-less NE reset child
binding/provider; the network engine requests its combined reset domain
from the parent. I will collect the remaining review before sending that
consumer revision.

Thanks,
Fil


