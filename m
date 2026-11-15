Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F6A606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 00:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZC4uHNSC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=03NpYBQg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k7NOu9mRwqKS6KEdePuU/ewkkmtEQ/cj2Ubt3cKxgyM=; b=ZC4uHNSCKT2255iOvHs3C6JmEf
	q0CQQBOp5vnRBeYxuFET+dmwMO4lpSrMvdVYCNlPY27t8/8MnmBHFygOIva44CZxLjwHm7rEOUPkb
	nNH3Vbq8rnr7ogyysV6Q4p7AXruve+kaRHIe8fJlnOA3Al/8fnFJe920pGZ6msCmEQJZIA9K9zBXN
	CS39GDigzBMoreppJ3TkRFELMfg3uolfr8anssjzo/83ZIIpdj/7QXeuwh0NvELf3SAYtUo7hVIzd
	FiB2xSnyP7CqMzPEItmjDhon5ntrDDTDFNPfM8bT1b/AS37odMtONFRCNkm0pUJVxaHv32CsLKc3A
	D4MRPzcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSOa8-0000000GwWj-0ryK;
	Sun, 15 Nov 2026 00:58:56 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSOa6-0000000GwW4-0oKp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 00:58:55 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so2503922c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 16:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794704333; x=1795309133; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7NOu9mRwqKS6KEdePuU/ewkkmtEQ/cj2Ubt3cKxgyM=;
        b=03NpYBQgpkTj6pvPMI9qwY4X0mxDyMYoB1ofP9luVWmM2Dpb5uIRui3F1VvOL//owm
         caHMeeakGbC8WK7kaLzJdHlO4OccAIaxbJP53fOQsHZkMnm6UqhLtm+CqJzIjasF5evq
         ZHhmOX7RpEq6IwQ683Jymsw2rRFKL1k6d/78eNtKzPEY4IqvPrM2k7kDqogZ7txEwhXc
         h/eLSVS78GPeoB1XLBBaOrmK/Moc09ZiSSvk9lPWDqMyHqAzK2IIjmgcyL63XrceAy7g
         QsYPGpTBNaTfNZWeQYo0zXlWfrdYNG9EpgRaI7VA6wuf8WPUt2vXImyIhlYY24v0Q8y2
         0Grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704333; x=1795309133;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7NOu9mRwqKS6KEdePuU/ewkkmtEQ/cj2Ubt3cKxgyM=;
        b=JSMKOuSB6A9dJg+Sufdgir0kco6guMrY6CQpWVnv1VkgIrNZS4VNEsHA/6Zp0SCh1h
         /+VbQsLkX7jedr4JMJGy36l44oAs8OxxRZ/8/MidwzUheRoi+/RL0edeU7nXXPZ18tJ3
         RkAlTh31O/1evrjhgsPsv9P8zov9vZJI4h+nNj9Zvncdsdy0eXhoWQqv+tDqwB7J6Hom
         Esc2TLOaTjR8g1E5O49mN3o8v9TNT4A+/KFd847NRkNufXj5NJPt4lWcrCA6iS4/xzed
         PdugxSZBYlA1MnESawDjvAO/cr5jIIqgIcXShw83JJcxc54ki4CmRBrf6UbpsDPSRSkh
         yVXA==
X-Forwarded-Encrypted: i=1; AL+hErGJc6jBW3D6E/+eNheHjLqSP/DMF/MYS8cQ66FXEilgmJ4mY+2mm5N+pXsE4v7Jx4LI33bRnW7Ro5zkkpMZgf3F@lists.infradead.org
X-Gm-Message-State: APuU4Z9dioNFytYwapr09F2rpcH0CwBoREhVGdw7U1yu41jYqcXxKpkx
	mhw/fIfewLbr+ulrMuEa00SWxw4NQy6f5mwY4MdpmPdzhxyMuR8uLFrv
X-Gm-Gg: AYBFou1Kj2Tg1EFZMU181iCbVgupJ3zg1s77XlhvNlE6VY8242MSnsTLV8r8D7q8QDP
	p5OIvKyWaU01StY9/ULO3TczFrumcvZeeNy06JCdjjJZx3Ymca9Vmu4YpIqqOqC+i/5j//uDces
	EAwPJ6V/ub5tSOOsUW5je67UeF/gfzaWnM4Ubb17MNEmEJKW6kaIxmPwybAhRvXWHo0p0VyWnaW
	utE+e0KwiMezAv7qB17kYd6i2TKzXMa/IkQTadAvrGsUyZP3p0RzkEIt93/aemSReuLvAWCyL9y
	gPSxyBFzgpFKj9R7U61G1Ghet2IwgyI/lyQBMVLZo4XASVJn0LDe0DaySywjRk73rlQ9iQVQxBT
	DEGsiCHP2VMVPbvou610OykBmMMiJi7hlvac7hDFgr+T2aZ2bhkQZw6fct+zbus9AFtVbnDefZ6
	1J2zLIt6+mEe+LZ4TayEjEfxievdFsaBBhM31R+6Zk8y6aJS5CRzIb9vdEVl8VI4C0BVuP6fkVZ
	gl5macDDEQfocg0lGTdJl9yc72Grvr5n9qCcJXvii3X5DMajn63SYARiWPXhLuNhixsdAqjXDvj
	nJrCEJPu7ougDTmj5d/zXBHoxjLy9Ev/JZ9KxCLR8VapPydzXMFk115+S7JNFcRa8nE=
X-Received: by 2002:a05:7300:e9c5:20b0:361:167c:2364 with SMTP id 5a478bee46e88-37966e3ab7cmr7375931eec.8.1794704333340;
        Sat, 14 Nov 2026 16:58:53 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm35679526eec.21.2026.11.14.16.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:58:52 -0800 (PST)
Message-ID: <0f536451-9f7b-46f7-acca-e10e54dec37e@gmail.com>
Date: Sun, 15 Nov 2026 09:58:48 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: devfreq: event: rockchip,dfi: add
 rk3576
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, kernel@collabora.com
References: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
 <20260921-b4-rockchip-dfi-rk3576-support-v2-3-04f847016321@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-b4-rockchip-dfi-rk3576-support-v2-3-04f847016321@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_165854_241156_C16E82EA 
X-CRM114-Status: GOOD (  18.24  )
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
Reply-To: chanwoo@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 9/22/2026 6:15 AM, Sebastian Reichel wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> The RK3576 has DFI hardware for monitoring the DDR's bandwidth much
> like other rockchip SoCs do. Unlike the RK3588 however, it only has two
> memory channels, so only two per-channel pclks for DFI.
> 
> Add a compatible for this SoC's variant, and add it to the conditionals
> at the bottom of the bindings file.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/devfreq/event/rockchip,dfi.yaml          | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> index 3450e28b4020..dcf3bbde3e8d 100644
> --- a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> +++ b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> @@ -14,6 +14,7 @@ properties:
>      enum:
>        - rockchip,rk3399-dfi
>        - rockchip,rk3568-dfi
> +      - rockchip,rk3576-dfi
>        - rockchip,rk3588-dfi
>  
>    clocks:
> @@ -64,6 +65,24 @@ allOf:
>          - clocks
>          - clock-names
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3576-dfi
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          minItems: 2
> +          maxItems: 2
> +      required:
> +        - clocks
> +        - clock-names
> +
>    - if:
>        properties:
>          compatible:
> 

When I applied it, there are some error.
Could you please resend it on latest commit?

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics

