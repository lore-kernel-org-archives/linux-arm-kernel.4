Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A69606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 12:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ffm+t1r6;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BA7Z0G2j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q5C/iHN7Lmzj8RXtCSxUA965C7B7NlmPdCiPikMVO9w=; b=Ffm+t1r6aVguTD
	cjPbK1Y6msTagSp0E4E9u38vGiiqpDv51PyClumYpDL/qDVaouY+Z3dYxC046FYp2KFWpPJaW07uD
	vTmDyvX2ZRDmxCQF9J9dPSr0ww0JxzcRVgS6sjZwOVgzx35PTxtwWHOSN+vqkDjFn4S8sbetMKbto
	NCc3N2wJndqJTtra7QT94uzadNxNCvymoSkuW2uip+rI3+w98urPaPOZVd2kmW/4SfsTYCDx6QSHA
	7/D9Kb7ccSeRrT9TOTDozFevryO9owq1x3j+s+QojtZTb9mx3bxmZhOHryq4AcnI5hbW2jk4OMaWi
	/zn78i9fpWdnGMVcFT/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTelR-00000008qFz-2w3Y;
	Wed, 18 Nov 2026 12:27:49 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTelO-00000008qFJ-2uzH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 12:27:48 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so756780f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 04:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795004864; x=1795609664; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q5C/iHN7Lmzj8RXtCSxUA965C7B7NlmPdCiPikMVO9w=;
        b=BA7Z0G2jB76EUGqyOq+5DivelS72d2cD1wSvdsuA8bRlVMv1dOHgqZXFHHecUxUVRx
         hhMU00hXWRK4T8Bjx/Pcf8nZbt69A3hYAvLc8367fNlqfdLjx0XJO0NqcsWIq3tRqq1o
         4tkDvkGYSXdq9QYXZstNI9NCYOxgJnw0d3dU44YHUoRH4x1kx53OmOAeA8myUXEj7RAO
         l3KJWKwTTO75ZNU0zjWolUh29rEOsLmFCXajjSXjV5t4rXYsDEMlccNg4JrwrPQNq2aD
         HOg40Gjmvq405B3G31ykz9+8vj5DujmHnMJ3JUoEWysRZldIbsNMj1tRXWUgfZ6Qtv5k
         z0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004864; x=1795609664;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5C/iHN7Lmzj8RXtCSxUA965C7B7NlmPdCiPikMVO9w=;
        b=J8LvnkN2Ntcp54Q8Tj0Z6X2GE4zCfn8h8WaJmr3C/5qsRtAP0TRo0TCUhk2FJKRYUV
         GOjYph6/5mPeJ6eE7keaEpq4Uk6+sZFmIDUb/YcFeI6zU2PPE+24d4DiMny22lsTMYfB
         eMcsWEbi8L9HDx5hrht07GiocibggXJARMGR6N/08N4wLlM99uxZu9YitGUDIpS6va3v
         O6Erg418mv4GjNRXJhocd5XYw3VFefj0rE30Sn2+4/44Ja2GGRkCUQ8D73AP72v6Vyc9
         9AQaRoJ30+dAaf4eaSE8Huy9bgMqkQMexocVwi11sFdKkz+kIQeKy/MN/7z3LoI6GryC
         Ow1g==
X-Forwarded-Encrypted: i=1; AL+hErGomlTh0qcT+B6qO3Uv7glD2qmhpicwb5EZr4GSo+SyKRzHCDiaxyrZrlt0BUG51C5hi2usZfukrh8pRs1YVk/n@lists.infradead.org
X-Gm-Message-State: APuU4Z9pOCFZSjE/JvKnQTzanUDh2wZH2VFx1AKmPY4PVxs8rVfbon/G
	exSBt6c0Rl/OPqBjddB3uzxrVGd+rDaDvvTA3fw1TpNVHkkSZ5RwXdXGf3iPId1QZ3g=
X-Gm-Gg: AZFdTZeP1BOP376ton64SLm/aWQpZgVStBunzmtmC1o0o/I2QsSMaDtwRB40uca4fQG
	ruPCzFQknPrcqjABnskGgXHR+AodHsj9K2YdsXFgJN7Y1DgeddPEgTirG6PuKXnTUybTWY/JFmt
	EggNJTFHAYraKDh6UlId8pIA9NNnFKum4BDkaDC8uUsScEJVpAPYupDzVLIy8367YzfPVtTmPl8
	Rf84IuIYh1HydJwGVvltZhKajrFcgWHaJMnfO3qYaJzuZEinJK5LS3E/xPdJnvXNqOlFOqUGYjU
	Qsb6hdIUFWaT/8tx8fMVJGh4+REThaJQ9Ip0zoCF+YGeBtxfVRJbI39eEi7hJAKHhFOkj7hx0BW
	aXAWucEzsZlrTWZqcSwEpSLS+yldoJwjLYSuB/X+neLvj35a70pdd02B9iTybgDz7YrYu76uCH4
	bbNsEgxmKh2opKVS8dk5W1JPedHCPJ8aF/QD7SwR1x4NPmiwlI8/LKoj7MOt9aQ4M4kV9b/ADSf
	D+Yp3zcXoRW8oM6232kUme2KjNB/o207FET/T6hk/xXie8uObBtnIYo06EMsVKppH0mtLrvX1f5
	SRD1t1kDGWyUAm6AdGkQdXjVfbdmxwuxrCdyFI8rKAr5aS43nrM5QFovs5oRRW5Gza3+Pl8o7o2
	w0Q==
X-Received: by 2002:a5d:4f10:0:b0:49c:fde4:1af5 with SMTP id ffacd0b85a97d-4a63bbc41c8mr4416511f8f.54.1795004864445;
        Wed, 18 Nov 2026 04:27:44 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3a7sm4875705f8f.9.2026.11.18.04.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:27:43 -0800 (PST)
Message-ID: <f91804a6-39bc-4a86-b24e-9588327e092e@baylibre.com>
Date: Wed, 18 Nov 2026 12:27:41 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Drake <ddrake@baylibre.com>
Subject: Re: [PATCH v17 04/12] accel/rocket: let the core suspend after a
 reset
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, ulf.hansson@oss.qualcomm.com,
 abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
 sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
 chaoyi.chen@rock-chips.com, shawn.lin@rock-chips.com,
 finley.xiao@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net,
 leonard@lausen.nl, vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 rfoss@kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1794615324.git.gahing@gahingwoo.com>
 <2afd051e37b8dd4f10e347a3537b0086973d554c.1794615323.git.gahing@gahingwoo.com>
Content-Language: en-US
In-Reply-To: <2afd051e37b8dd4f10e347a3537b0086973d554c.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_042746_783167_2871681E 
X-CRM114-Status: UNSURE (   8.74  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 14/11/2026 03:05, Jiaxing Hu wrote:
> The earlier test on the ROCK 4D was done on the v15 code: the job after a
> timeout went from all 128 channels wrong to all 128 correct.
> 
> Repeated resets were triggered with a 2 ms job timeout.
> 
> v15 (put, then reset): tested twice; both times the board hung within the
> same second as the first batch of job timeouts, with nothing printed.
> 
> v16 (reset, then put): tested four times; the board never hung.
> 
> So moving pm_runtime_put_autosuspend() after rocket_core_reset() avoids
> the board hanging during a reset.

These sentences (history of the patch series) are commentary rather than
commit message material, they should go after the ---.
See Commentary section in submitting-patches.rst




