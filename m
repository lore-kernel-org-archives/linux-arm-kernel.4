Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A18A606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 14:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hriIilVa;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KNppYKNq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zDDmPLN/vORV4feX+wDc3Z6tM6cjTEDR9e6IezQyu0M=; b=hriIilValzbjc7
	Bx4Z0S5EAOLMUXOLsDBrJIQJ/46St/508haMqNcNCpWDRxef1A4Pw1G2x2uNoE0UrcZw4z5dOiWmd
	crXDHWCfFZIZgFzBFCbeL8m+6Jv7dyFiaZ2BUayXczf1/H40yzgA1Emqq2DydughcwXJT496KtUMp
	Li4KBinoDrTS6IWsDV0kb5L5v27vi5uhnX8BL8JaY0gXIE5j9+NS6GwH2W76uuzlWunulc8q6kbnQ
	s+WlrpzTy/u220EV/ARMxQt75jzSkQTCmS+lg5zeq9b965uaWEKnGOvO7pzqZ+Zw3Vq9u9SxF7Li/
	IKP2GQqYyCG1xuY2D55Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbDU-000000003Uq-2EAH;
	Sun, 15 Nov 2026 14:28:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbDS-000000003UA-1Ia4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 14:28:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 168C143ADB;
	Sun, 15 Nov 2026 14:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3BD1F000C4;
	Sun, 15 Nov 2026 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794752902;
	bh=zDDmPLN/vORV4feX+wDc3Z6tM6cjTEDR9e6IezQyu0M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KNppYKNqzAJleubEyIv/tWcxOhGjxkZs7qlH7GlP0JYNDiCL7lENbyJ+nXwmcWiMC
	 Reg3MLIFS+xZuxjjwylVdR7VvoH//ltRG03j+abTQBtg7T9N2I3RRSAuRhce175fRI
	 n/Cm3kro0Bh9qdcXcU4lrbnzhLstY9arcmnXrgTrmL8KSNBM5pwA6BSfCH8ktju6mG
	 Nh4PNvJlJaP0MuNpD8hKiNt8u/vq7OYDVvUaT5sqazJURpHw5yFglqvPXIpXEKdP/A
	 UehrxSkjDzJLMCkxMehfDbvhChes7bbU2ngU/0Q2tI41djj5YZAGiYkqnh832xmLTl
	 rJfBUnDnOeDvA==
Message-ID: <ae8bc8ad-3846-427a-8910-e33ce07f599d@kernel.org>
Date: Sun, 15 Nov 2026 16:28:18 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/16] nvmem: microchip-otpc: Expose UID registers as
 2nd nvmem device
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-12-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261105110715.2486432-12-ada@thorsis.com>
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
> For SAM9X60 and SAMA7G5 the Product UID x Register containing the Unique
> Product ID is part of the OTPC registers.  Expose this unique id as
> trivial nvmem device in a similar fashion like the soc sfr driver on
> SAMA5D2 does.
> 
> Signed-off-by: Alexander Dahl<ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@kernel.org>


