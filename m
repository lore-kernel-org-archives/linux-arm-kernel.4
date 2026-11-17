Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21812606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=in27tKiO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cclKC4VW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tG6neAVh4oCzGf1sct8/MQCA9dZCIT+3BlbcZwi3Bb4=; b=in27tKiOXrz8WmEx8tkrFGCFYF
	KFZAV+UgoE3CvxYyF+FlHwWh2ltagBI85LGUYjDkHUrydwv/1o9DEnd5CuQw8CDRUK+jRPFMvVPWA
	gNXemVM9xHrBFSZgb1zRsJ2ZhaHg9y5pHY8Ypt9jQd9wDQjfDFOjUfWmp3RFVnZdUUkyzhfYCCZwF
	gg7MVhARB1uRACd6CL4dkMzVYunYYQpe4NT6eYOyIJFF78QlGbksIPBrp6wW8C3duyUEcF6fdHkTZ
	xjOvGT8Gl/NEGic8kDdth1O8GRKefLyV3yBcaXGy5A6YsoF+G1NJy2At00bW7zRe7imj6HNdFtf7l
	TN6ZznYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJyx-000000064ze-1Ife;
	Tue, 17 Nov 2026 14:16:23 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJyu-000000064ys-2uDE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:16:21 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-380b40319bdso2273381eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 06:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794924979; x=1795529779; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tG6neAVh4oCzGf1sct8/MQCA9dZCIT+3BlbcZwi3Bb4=;
        b=cclKC4VWwqAsTIEuL2Bp3EnY7TQFr8pqiYfaO2WtfzaLTvBQLl3doaRYReBMcYPd4d
         FOp3rUJHzgIY0Ri6lOiKMuvAMO/dHgqt0B8PgpceZqNAjFWf2+piS4/2dc5jmOXgpL9B
         D22NFet7Z1PXeeYnGLBjwJ1P+Kjuj134xjNUtIUYn67bH7Yn8Kr0mxv9GOAs5ogSjC+K
         P0txGsj0rZUIshsuspSBkJrHe1IsZD/g3eJ62XWUQDXf6k7RJG9l09lrQKpuoMDgDVyb
         lnZMn1G0161n/CAZ4/VJy0g1jfCV06kTyywU9qKezua2IdRoFbl7obDb6OjXLTLIvsG8
         gtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924979; x=1795529779;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG6neAVh4oCzGf1sct8/MQCA9dZCIT+3BlbcZwi3Bb4=;
        b=pKDwV9GmJVfUV71/pcjAAkyYJOOm2lxn43S23EHJK8UZzHXBzSaet3gosZr3M6iMBK
         mcm78Au4ZU2XrOn1G2d+WJwAfC7WQBf4Sx442km4tumk7fCI7f+0oZHUAq6Jz7amdDya
         1Fxhz96+JYET7eQ/w9hEajL1LZlRLix9JE6yxOjVbCqaCBI7sopegxIztGyJq8KTEKzp
         eJlCTkewtiP5XV+nEs+dFXJjEOFPhMvl9TOO9kY1fuOKcYeRNfsm8hJSGGvANdUsimBe
         LPClA5RDCWWFZ8Af3eYrsEjoaH7bT/S6f8r0mb1nBvbwsN/b5I/UMF/MQI9VLjGkMrpt
         +qQg==
X-Forwarded-Encrypted: i=1; AL+hErFchzHarkkxf/0EmhsIl0+hDTmEtiyV4JFd+DhIULeH3C4LXJ1+1DoWwBpP5083GEyVlqdmlCchU8U4yqmVvyi8@lists.infradead.org
X-Gm-Message-State: APuU4Z+xFWL0Ix6dXcktrviTp+75gzUA2DluhzGY443g+FY6+I4Euv7L
	dTZef2Qvig+OHOWPZ9XHJa4eHK3nT23LUZWcTzysqIIv+cIFrw3x/BMW
X-Gm-Gg: AZFdTZfO5ChCIsH8ORzbV5ITOozDz9AmbTdCqY7TTjmfHICOcxyLcstzdpfhFxYr4KH
	eZGzVWbyQ/R5sZOjkb1RfMPZaeQ83bmFozNJWuKt/aIP0YS0gDJEQgWfGV4DE6IvVraXu2arema
	ralD2ZaVIaEUR+6eaR8hPK2CSnPYNWpKxXSJzI3iBNZvZjVgVYGMmVNflL8kEnCNWtiV3T4cl5h
	db9jpjFoFQt4IaDQa0GEJA+Q7p57s+xxO7yQbRtz7itsAe134V8FgcZorf1sk2w6m9JF3RwtFL5
	NBT9aytgz7+zY/LdliMPR7puHnC3pSy/38tetGJzQvV31UKL7vQ2qNigKYSYgtDterWKDGsWXq8
	FQrju9+AZEpN4ecXRiku5o3Nlq0xvkWtdDMlkoTBcQvnMiPm8dLFjpwu+LmedO8SfYTNoVYd7dd
	WwI6j3EdcTICd8NMqQrLp4JnNWZgE2Wl7DM4wMsPHCcJSqSXq5/PKkg7j9Nm6OoziU7ePh9aY4y
	djvs6YR67QmShCrPI0Lwvu7VnL72Figr8A2kHDmSH0vruzUxh7DshosNMuLgRTTRk93Y069ULZj
	/k5EFkDPCCiZnXz3Cg==
X-Received: by 2002:a05:7300:c88:b0:36d:7f5f:7e97 with SMTP id 5a478bee46e88-37967dd734emr19474818eec.40.1794924979189;
        Tue, 17 Nov 2026 06:16:19 -0800 (PST)
Received: from buffalo-ssd ([2a09:bac1:3b00:a18::2ff:99])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm9540594eec.24.2026.11.17.06.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:16:18 -0800 (PST)
Date: Tue, 17 Nov 2026 23:16:25 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved
 aliases
Message-ID: <avxXNp5xEbczbb1y@buffalo-ssd>
References: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_061620_735190_F1A2B8DA 
X-CRM114-Status: GOOD (  12.22  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

On Tue, Nov 17, 2026 at 02:05:57PM +0100, Krzysztof Kozlowski wrote:
> The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
> approved by Devicetree maintainers, because they were never documented
> as actual ABI.  Drop them, because no new custom aliases are allowed for
> years now.
> 
> This might break users of this undocumented ABI, so these should be
> updated to use only documented and approved ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

You mentioned 64-bit MediaTek SoCs, but the same class of issues also
exists in 32-bit MediaTek SoCs under arch/arm/boot/dts/mediatek/.
For example, mt7623n.dtsi has rdma0/rdma1 aliases, while mt6589.dtsi,
mt8127.dtsi and mt8135.dtsi misuse "simple-bus" for the "clocks" node.

I hope this push for correctness doesn't lead to any regressions.

Best regards,
Akari

