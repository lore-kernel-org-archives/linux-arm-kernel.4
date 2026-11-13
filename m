Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FBE606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 23:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QMgRj6Yg;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=QCOUxpI+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SwJd2Py1hwLAkVWbC1tuBf/N4RS+TrQ8utxzBCwMfb0=; b=QMgRj6Ygy0Tyxi
	sjldVI7rZW7/z9PWKwjukntuPLOzGqj7vJ1K1lqrkdOUBt6SpUhKqZL6mceeAXT/P+r5wCGGtjwKa
	7hTDRWyGloEA02BTqYj+AbUessmvO2S6jvkgXQOhfXowxNtoJDW8EB6u/FMAAMzzN51QzpEtHUsjg
	o6TvqddXTg56zuwob2Oq57ZIr2J45AoTX3gZQjcOYMkF/PobNffRG6jxilpyu6mi6ozlZGfQ6ENZR
	XWG4GAjbmQbY8gE1VrWGBgYN3UrND2Lb8hCzDxDEL5w5Au7z85tZPNwcLF57qHX+pDDrTMshVDL31
	I4tDAKU2yiGNytoKkL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS0oG-0000000EoGf-1jOL;
	Fri, 13 Nov 2026 23:35:56 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS0oD-0000000EoG0-3tK2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 23:35:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 962D510E82A;
	Sat, 14 Nov 2026 00:35:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794612947;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=SwJd2Py1hwLAkVWbC1tuBf/N4RS+TrQ8utxzBCwMfb0=;
	b=QCOUxpI+NarMDypkl+ZoWqpecl86onLiTCg0GHwYAECMLhG0eAe8/nTgT9b2pdygvS59CY
	uZnlIg0WjuYyIV56Y/jkO3xZTCWTJPjSFy4nSQ2sjIv9Swly9Neh5navjUViVCOs8OuixI
	YARv2L0R/UXVNd/NiArPzexTaBlX2oQQsPGkzbPjMlKxQmpGfP5WmFPsMC6wreSfSrJdtF
	R7irg1qXBw0NPcXULvieSnWNEIuilUURPd9isf4Rero6uP5EwV9JPnVJcTIjClqYpdgR6J
	6tCDBk8b7E2nC+d8vDyDpRKQZzedKQl/zeQudM30+/Y0uL0/L7BN2vhO+/HzYw==
Message-ID: <941bcf61-82f5-49fa-ab38-2bca3deb05f4@nabladev.com>
Date: Sat, 14 Nov 2026 00:34:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: Move Bluetooth to USART2 on STM32MP23xx
 DHCOS SoM
To: linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20261026125201.76716-1-marex@nabladev.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261026125201.76716-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_153554_193873_C5B59749 
X-CRM114-Status: UNSURE (   9.15  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/26/26 1:51 PM, Marek Vasut wrote:
> The Bluetooth chip is connected to USART2 on STM32MP23xx DHCOS SoM,
> adjust the DT to match the schematic.
> 
> Fixes: 6642d6a47901 ("arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC")
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Is there anything to do regarding this fix ? It would be good to include 
this in 7.4 before it is out.

