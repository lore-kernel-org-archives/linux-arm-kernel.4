Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87EB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 18:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kTnq4imZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hAkHLf5B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g4hSmDe/hNxM+mVYy6mm3ToAC8B9Vj/cAi+kvaP3/tw=; b=kTnq4imZ5WHu4E
	q6IRy/g94p5N/ksxxNR7Lwz+M3cAyY16xejyFn7dnKIxQFSPSbxVcVKbOs0QEw7aqr06EO+HGtL8E
	OHFl+Tb+rl198010Gxf3PyXtr81gEYly1iJko74ABSXLO2OyCPQs8WpeqWWqWi7Iz15sS+bW6mQIP
	DeAHHxmAxY1SoGokxBrtqS+D8aJGNP9V8V+/JRWcna5daoz89KbGeiP3WG4skZR5cB6Ra4MymGKIP
	d+FgLIeD9RoEjOqPVkFThMSIjlKeo3HnEc0qCFqOM4U6ZGqTWaVjKWNUFK2hwHeZyiKtZBNOtLqNA
	78UugmdvyzgKzLF6Ff8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ7SU-0000000GSuT-0oA3;
	Sun, 08 Nov 2026 18:17:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ7SS-0000000GSuK-4C8K;
	Sun, 08 Nov 2026 18:17:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD9C141B15;
	Sun,  8 Nov 2026 18:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6208F1F0089F;
	Sun,  8 Nov 2026 18:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794161856;
	bh=g4hSmDe/hNxM+mVYy6mm3ToAC8B9Vj/cAi+kvaP3/tw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hAkHLf5B2tv9F1+dzjDqdVR6k60D/15cmhkxtgW897siA9SGc0XscJqjW4V/ech4K
	 yw4+9h2O/FbgBD1BN1G6gPOX5mRPlKi0hUZ5cvwoWE1bIZwdq+QUcCsQFvYBMnHbyN
	 WGgBu3JWpqhRt+n23qKZZJbXARtzGL9jgaQX/1h+DOLJzl858I8c4rws/umvBP0qW+
	 s7phRIXI/RdWSD3keJZ5xTw47MTDzittQDNDjWQx6IO7JsyRV6VgSLFp6vC3MpHyBj
	 JwMrf8s/nt18oV4+im+WnzWjrdwAsHo13pxY26pXPdUaOLfrRG7cZeVivDVJ3wVmky
	 dEFab83yXXfJw==
Message-ID: <4a6ae329-0d73-4ab7-bd87-7acafcb8778b@kernel.org>
Date: Sun, 8 Nov 2026 19:17:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] phy: apple: atc: Add initial M3 series support
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
 <20261108-t8122-phy-v1-3-c2783b2a53a8@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261108-t8122-phy-v1-3-c2783b2a53a8@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/8/26 16:43, Sasha Finkelstein wrote:
> Adds initial support for the new t8122 phy. USB/TB only for now, DP
> will fail to negotiate
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>   
[...]
>   /**
>    * struct apple_atcphy - Apple Type-C PHY device struct
>    * @np: Device node pointer
> @@ -599,9 +647,10 @@ struct apple_atcphy {
>   		struct apple_tunable *lane_usb4[2];
>   	} tunables;
>   
> +	const struct atcphy_hw *hw;
>   	enum atcphy_mode mode;
> -	bool swap_lanes;
>   	int dp_link_rate;
> +	bool swap_lanes;

ugh.. somehow dropped this comment from the email i just sent..
is there any reason you move swap_lanes around here?


Sven




