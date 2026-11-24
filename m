Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41645606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FepopIfe;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=MF6CPISN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6wsKLq9kxl5csJ8c/oj+CJg3ej4KmwWP9pDuJWodbxI=; b=FepopIfepdW7Hl
	zqvzxlH90fySR+sjoJnJEfx0RHOTPd1ChmmDOuUD7rpH/KLsLnfkSrqPZaH8zo0g2e8obG0g+xq20
	nmf6fWqccpkSKjuqau3RNzL6BPeG989lKtB0N48X1AIW97JmehSgURr2xFtGcQzxkrJEAfSZ4QD82
	3j50OdOpEjRk2UqxWogb6TjtDwS5Xl0nHA8O+PChBKPCqEIRp784RrV1L3eK7nFN+KIid3c5E84qM
	zP0827IJf36v7m5aKmykAnIFZ+C7gGsdk1KUmzg/wGWlHmBY5kAMsM1W8cIsM/415zz+vLBCL8MQq
	cZhFusMsAbdVVQQde4Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqpK-00000006g76-0wCI;
	Tue, 24 Nov 2026 13:44:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqpG-00000006g6j-3103
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:44:52 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C00C9BE1;
	Tue, 24 Nov 2026 14:42:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795527732;
	bh=Nj3YniFrzVnITRBYaPQKl7wSY/zEuckU+cg5R2aciho=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MF6CPISN2fCrzJXba10MkU3qtJaBi9SZ92H4Wp38+lsUI8RQF25e9/gy5Th8uUSbp
	 lH6daagHqHo6aRNf9L5kXgereuYX6RWJnhkbqbGjzHw8HeUjCghwSC0T+8hEhhVYRd
	 ahZGGa+kk0z0noN5r92mmWrWSTbk80Ux1YKeTbJc=
Message-ID: <7a94fa5a-ddfc-449e-b014-387d8e868e97@ideasonboard.com>
Date: Tue, 24 Nov 2026 15:44:40 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/bridge: tc358762: fix reset handling
To: Andreas Kemnade <andreas@kemnade.info>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@nabladev.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20261124-tc3-reset-v1-0-a5d27fe4b5de@kemnade.info>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20261124-tc3-reset-v1-0-a5d27fe4b5de@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_054450_908747_18D10952 
X-CRM114-Status: GOOD (  16.66  )
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

On 24/11/2026 13:54, Andreas Kemnade wrote:
> The bridge driver desserts reset after disable and asserts that
> upon enbale. That requires users to workaround that by declaring
> the reset gpio wrongfully active high. As an interim solution,
> ignore polarity, until things have settled to fix it afterwards.
> That will break setups with an additional inverter in the signal
> patch but those should be uncommon, at least not seen in in-tree
> devicetrees. Fix polarity in the one device tree actually declaring
> a reset line. That patch has to go in after the bridge fix.
> 
> The issue came to sight during experiments with reset lines on the
> Epson Moverio BT-200.
Indeed, the driver has it the wrong way... But what is the way to fix 
this? Fixing it will always break the backward compatibility with dtbs.

Is it worth it? Or is it easier to just adjust the bindings doc to 
mention about it, and add a note to the driver that the gpio is set the 
wrong way "on purpose".

Or, if this is to be merged, I think the code around the 
gpiod_set_raw_value_cansleep calls should have a comment to highlight 
why it's calling raw funcs and what the plan is.

  Tomi


