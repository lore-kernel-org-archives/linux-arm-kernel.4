Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2368B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 18:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G6qpsSWY;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=vnZPO7K9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IEc9ZGuUWt0IoGuerT4chM8IoSWASGRdad0LdA8y7vY=; b=G6qpsSWYUFbaW9
	f15hSwW2dO96RLAiZHxIM+UPTTqH5bpYZqvXcGhjGQ3uXwIck4azUQoxJum4ebWPf/bVdKnQUTWNS
	PLxtqWME2R6s17YiIpuPIxnY3hQauLZ3ituXebNjcW1O92bgWrP2Z/WJgFBAh02nvR94P8eGHf9Dk
	a0k4rc6b8s+7Aiz72Mi48wAtIAxxfqm4TQvs3J7Bdu7NGNl0KJHAlrW9C26QiP/XdNgCoyvspmQi6
	VoS0KTo1m/u8d9O/ExLzWrcZtRWl8i7/7ftT7G5EByHHODXkmHjxCDKRg12S6J7IZC0oPtBGc+I8G
	Zekx9oZrRJyb628eXlgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ7Wj-0000000GT2n-3dO7;
	Sun, 08 Nov 2026 18:22:01 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ7Wh-0000000GT2F-1AZx;
	Sun, 08 Nov 2026 18:22:00 +0000
Received: by chaosmail.tech (Postfix) id E1BB61C9627;
	Sun, 08 Nov 2026 18:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794162114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IEc9ZGuUWt0IoGuerT4chM8IoSWASGRdad0LdA8y7vY=;
	b=vnZPO7K9kRlz8SghCkQLzjjKHdtO6/FrK0I3NE0t7dobQRFY0AGulEeGu+0+k+wsOIpnY6
	qSaYI9iUJw+tZXBFSZURadW3JlutQhW+cSOU4h61BeF5wu9CwxGXKi72lJ/hSjkZjdcp8P
	oKPKITy4nEc80X+NqPAXOBiAfaWvBhA=
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] phy: apple: atc: Add initial M3 series support
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <4a6ae329-0d73-4ab7-bd87-7acafcb8778b@kernel.org>
Date: Sun, 8 Nov 2026 19:21:43 +0100
Cc: Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <F39FDF3A-E5DB-44F8-A31C-7856F7FA41F9@chaosmail.tech>
References: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
 <20261108-t8122-phy-v1-3-c2783b2a53a8@chaosmail.tech>
 <4a6ae329-0d73-4ab7-bd87-7acafcb8778b@kernel.org>
To: Sven Peter <sven@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_102159_785704_F98ADC12 
X-CRM114-Status: UNSURE (   8.70  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Nov 8, 2026, at 19:17, Sven Peter <sven@kernel.org> wrote:
> 
>>  /**
>>   * struct apple_atcphy - Apple Type-C PHY device struct
>>   * @np: Device node pointer
>> @@ -599,9 +647,10 @@ struct apple_atcphy {
>>   struct apple_tunable *lane_usb4[2];
>>   } tunables;
>>  + const struct atcphy_hw *hw;
>>   enum atcphy_mode mode;
>> - bool swap_lanes;
>>   int dp_link_rate;
>> + bool swap_lanes;
> 
> ugh.. somehow dropped this comment from the email i just sent..
> is there any reason you move swap_lanes around here?

It saves 3 bytes of alignment padding. Yes, it makes no sense on
machines of that performance class, but I could not resist. Can drop it
in v2.


