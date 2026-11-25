Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C72606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tZTFhTiv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XRTFH2Zu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7Yn6sJORWGIsC1ZVUYbbL7nWfxqpI4W2q6kyK2Foowk=; b=tZTFhTivKNwWNC
	RgiyPdskApQt8T/Jtorw9f1ycWygYm8IKAMLI2vXNnPaSZiJ/cy9UAiI89UaluKkrbXejTxw7OT7w
	QKwWhJg2h+0LjHFknbGKmd++3sRhHIyZoOKtHXihLMgSZZQeUCCb9l1jCrtGKvbNfs4fCJlIpBkdj
	setsYZtvm7oqaTbAiqZcpCZ6C5Y2ULd+SDIeSiocCtielX8ICIXQ3gYz8REbailt8SPsRRc8MxjPl
	KGfhqfie0FM/DrQ/qAl0vdW5+bSSFjbm5vD4T6Goji4O0qJWmphDpY5L9VPva73OjMF6g2W0mpzij
	RbRHJzeN9FjvEFsIkdMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9cw-00000009MdB-2RkF;
	Wed, 25 Nov 2026 09:49:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9cr-00000009McR-2hGO;
	Wed, 25 Nov 2026 09:49:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27CCE43403;
	Wed, 25 Nov 2026 09:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A611F000C6;
	Wed, 25 Nov 2026 09:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795600157;
	bh=7Yn6sJORWGIsC1ZVUYbbL7nWfxqpI4W2q6kyK2Foowk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=XRTFH2ZucxZHM83JzPFiSdcmPPT3wcsWjCHJjJCG7H97kVOPEDiRJ5ebLUh+FKM98
	 r8xsy4XCVGdoOBt22UG2v6+Q5DWOiTA8TK0x2eVyXtLNTvS1YtqAt5AmyJC7HM1Qcl
	 wvUXO+ltUiRqptPfnPw+yETuEsuW/UZGaYpZh+weR0DJVntSlc1t265KJC6pftEx1r
	 I/lCtAR0UwIL90pBS9WndZ/GYj/6mczD8DF6Hsv4X2mpmST1smHoiRRPb/rl2BNzBU
	 R4JIrTmg7KAdMju3X6/SWw5O76LllhCJVTWZ2iWCmAlXlTnPQzZ0h4NFgmN0NjBvhM
	 bpFNDvAe/QBkQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/8] dt-bindings: soc: rockchip: grf: Add RK3506
 compatibles
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261122060114.773624-2-jonas@kwiboo.se>
References: <20261122060114.773624-1-jonas@kwiboo.se>
 <20261122060114.773624-2-jonas@kwiboo.se>
Date: Wed, 25 Nov 2026 10:49:13 +0100
Message-Id: <179560015396.14607.9966958712968902485.b4-reply@b4>
X-Mailer: b4 0.17-dev
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-22 06:01 +0000, Jonas Karlman wrote:
> Add the GRF and IOC compatible strings for the Rockchip RK3506 SoC.
> 
> Table 1-1 RK3506 Address Mapping in TRM for RK3506 contains following
> related entries:
> 
>   Module		Address		Size
>   GRF			0xFF288000	16KB
>   GPIO2/3/4_IOC		0xFF4D8000	32KB
>   GPIO1_IOC		0xFF660000	64KB
>   GRF_CORE		0xFF840000	16KB
>   GRF_PMU/RMIO		0xFF910000	16KB
>   GPIO0_IOC		0xFF950000	64KB
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

