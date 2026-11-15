Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104B9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GA736sg1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E42ORuad
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kCawLRA6+IU0oelNwl5dUn/guLy83xt/1yBxt7PC4hE=; b=GA736sg1uk3HkT
	JeTVHf3NdsM3EMljGZBVmHfEIGiabHzq/94sgZp3KAVwQZseR1u+KEiB13VYSbMR8glgawV/qhrhB
	fZvSSK5C+H9vq6MeViMcNuF9b/h6xrenBik4GzJ4+9exIP1B31TBhIXO5zjqFWuURC4AVcTZaJcwM
	wCH6pSu3qoED4p7H98OI4TB8y1JIAUg7/tYSf2VUpFPFE5WFp1sAH7xqejYWsK1BSJqY2avHnfmdN
	K3ZOoNOtkBt1XfDoTSwycOdPv7LO0+u5cDSP1J4alCiY8StGCmzNPHpOUWo/nGehJJ0M9q9+I7BSz
	eeOds+TL2OJC8zeO1Rhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbCo-000000003IN-0PX9;
	Sun, 15 Nov 2026 14:27:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbCl-000000003Gt-47du
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 14:27:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 214D461DF0;
	Sun, 15 Nov 2026 14:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A46C1F000C4;
	Sun, 15 Nov 2026 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794752858;
	bh=kCawLRA6+IU0oelNwl5dUn/guLy83xt/1yBxt7PC4hE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=E42ORuadxu0R04p2j23jD3e9gJwasbPPgO5KnmTpkb/rKDf6SFu1aev+tFk7w7NO7
	 PeEplVzbO8b7L3NI/u0g8pAGsQSTHsUCBrV3XEPZYHH/V3PJXq7xwpGsCFx8aakNI3
	 FqZubuGwbMCr/+GLP6PHYJi1wdY70yadR1OFlzXnqrJMC6ai6s0qAOyET/7B9CIdof
	 J35d7LZdEnePKIIFi2rpP6MjU46HRBlAJwzBdCxNtxG9te8S8GBqAkBrWR4Pa/TwaT
	 3vrj281nVIMUW9k89RHjzWCGXAo7FM3+cyvX++kiuSAquqZkSFS5yiQXwdAGLg/leK
	 BHQ1GDrpgkxyg==
Message-ID: <1d45ab58-9e5a-4b9f-adc4-691a99f0e05e@kernel.org>
Date: Sun, 15 Nov 2026 16:27:35 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/16] ARM: dts: microchip: sam9x60_curiosity: Enable
 OTP Controller
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-16-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261105110715.2486432-16-ada@thorsis.com>
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/5/26 13:06, Alexander Dahl wrote:
> Allows to access the OTP memory and Product UID now.
> 
> Signed-off-by: Alexander Dahl<ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@kernel.org>

