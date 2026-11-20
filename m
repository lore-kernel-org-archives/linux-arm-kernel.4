Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F557606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ieJRz3Cl;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ahd7y3/K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l0oOPOqoS6O4eTceK2XRqL1eFQ1+GtanbURyb8V/HdM=; b=ieJRz3ClkX1UeX
	pQCp8hc+VzimqfjV356Xv4e90rV0iMk2xdFV/XMTIbxGikKCDDcOMklrHI7iIYIfe5zpt4YGW9Xzo
	BSY9OV8Wr3W3xvkYi5gP0lKvBblmbva/Rgi6cqK/Y0CKhdNdRXiu5lJV9YVDqmUt1T5UVC/YAIlGP
	MrlYmZUWwITFdnQPy1JtNvvLuMWvzTNwP2SlI3dCrS38u0vrtEcT5uw+8W9uDrDo8DkAE2tkQ59Zw
	iJnF0MW2Z7Fo790IrRT45aCD7wyY+nNNdFQvNLSFlE5tC1NEdLK7egHaX5NH6A7qw7MI/aqf8UXCJ
	qPvJtnkcuEEs4tQSVZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULlw-0000000EaZN-3eEx;
	Fri, 20 Nov 2026 10:23:12 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULlt-0000000EaYT-43Tn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:23:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D55FA1A173D;
	Fri, 20 Nov 2026 10:23:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9FD656017D;
	Fri, 20 Nov 2026 10:23:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4C9E11BC12B8;
	Fri, 20 Nov 2026 11:22:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795170184; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=l0oOPOqoS6O4eTceK2XRqL1eFQ1+GtanbURyb8V/HdM=;
	b=ahd7y3/KRLuGXbKFuJU+sxd+SulSkEpFUj0w5OZpcYq5//6lLr9VGTmhC5bn1uNU34NAFQ
	VgMt1quyUhSy/wdHc6zIdOlgPHtlRkc8egnwFMyV2IS/Tb9i+qWitgDT0rjkcMlO2/FgE0
	+yJtKtQbgPFvWRA5jJRxVWPgmpG1SVOB8PXKmwdia1f3KT3MaIjDwIWhtEH7+hKrPoRHIv
	HNPRjRYbVxc7PWTBTiYblxaDqOpob+PAg1ig0X+T9oNuuU5HrLqeZ+K1s5ZXClDSeXGfbl
	t6xJTj64pdfciybVB7yE5UI1JOS40s0qXFGUYDBda26jPjV1149d4nh9LCXtHw==
Message-ID: <4f7183c4-5a59-4c4d-8f33-a307fad4d7e3@bootlin.com>
Date: Fri, 20 Nov 2026 11:22:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: xgmac: Report the VLAN tag type
 from the descriptor
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 ovidiu.panait.rb@renesas.com, recv.jo@gmail.com,
 muhammad.nazim.amirul.nazle.asmade@altera.com, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
 <179510815456.3136.11469597684415088@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <179510815456.3136.11469597684415088@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_022310_148955_BD0DC33B 
X-CRM114-Status: GOOD (  34.20  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/19/26 18:09, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] This patch is a bug fix but carries no Fixes: tag, and the
>   subject reads like a new feature ("Report the VLAN tag type from the…
> - [Low] The ET/LT macro names in dwxgmac2.h disagree with how the new
>   dwxgmac2_wrback_get_rx_vlan_proto() reads them.
> 
> --
> 
> net: stmmac: xgmac: Report the VLAN tag type from the descriptor
> 
> This adds a get_rx_vlan_proto() desc op for XGMAC. The op decodes the
> RDES3 ET_LT field and reports either ETH_P_8021AD or ETH_P_8021Q as the
> stripped outer tag type. vlan_rx_hw() now uses that op when it exists and
> keeps ETH_P_8021Q as the fallback.
> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> index 6719ac6e395bc..71ce2bc9b5e11 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> @@ -76,6 +76,18 @@ static bool dwxgmac2_wrback_get_rx_vlan_valid(struct dma_desc *p)
>>  	       et_lt <= XGMAC_ET_LT_DVLAN_STAG_CTAG;
>>  }
>>
>> +static u16 dwxgmac2_wrback_get_rx_vlan_proto(struct dma_desc *p)
>> +{
>> +	switch (FIELD_GET(XGMAC_RDES3_ET_LT, le32_to_cpu(p->des3))) {
>> +	case XGMAC_ET_LT_VLAN_STAG:
>> +	case XGMAC_ET_LT_DVLAN_STAG_STAG:
>> +	case XGMAC_ET_LT_DVLAN_CTAG_STAG:
>> +		return ETH_P_8021AD;
>> +	default:
>> +		return ETH_P_8021Q;
>> +	}
>> +}
> 
> [Severity: Low]
> This isn't a bug, but the macro names in dwxgmac2.h don't match how they
> are used here. The only comment on them is:
> 
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h:
> /* Error Type or L2 Type(ET/LT) Field Number */
> #define XGMAC_ET_LT_VLAN_STAG		8
> #define XGMAC_ET_LT_VLAN_CTAG		9
> #define XGMAC_ET_LT_DVLAN_CTAG_CTAG	10
> #define XGMAC_ET_LT_DVLAN_STAG_STAG	11
> #define XGMAC_ET_LT_DVLAN_CTAG_STAG	12
> #define XGMAC_ET_LT_DVLAN_STAG_CTAG	13
> 
> Read outer-first, XGMAC_ET_LT_DVLAN_CTAG_STAG means an outer C-tag, yet
> dwxgmac2_wrback_get_rx_vlan_proto() returns ETH_P_8021AD for it. Likewise
> XGMAC_ET_LT_DVLAN_STAG_CTAG falls through to ETH_P_8021Q.
> 
> The commit message says "note inner/outer is reversed in the macro
> names", but nothing in the tree records that. Could the macros be renamed
> (for example XGMAC_ET_LT_DVLAN_OUTER_STAG_INNER_CTAG), or could a comment
> in dwxgmac2.h give the tag order? Otherwise a future user of these
> constants could easily invert the mapping.
> 
> If the names do follow the databook's outer-first order, the mapping for
> values 12 and 13 would be inverted. That can't be checked without the
> databook, so it would help to confirm which reading is correct.

I don't have the databooks. The AgileX5 doc is pretty clear about which
value is what though, we could rename the macros but that's not very
urgent IMO.

> 
> [ ... ]
> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
>> index fb9aad748cb34..bf23d82e9f383 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
>> @@ -209,8 +209,12 @@ static void vlan_rx_hw(struct mac_device_info *hw,
>>  {
>>  	if (hw->desc->get_rx_vlan_valid(rx_desc)) {
>>  		u16 vid = hw->desc->get_rx_vlan_tci(rx_desc);
>> +		u16 proto = ETH_P_8021Q;
>>
>> -		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
>> +		if (hw->desc->get_rx_vlan_proto)
>> +			proto = hw->desc->get_rx_vlan_proto(rx_desc);
>> +
>> +		__vlan_hwaccel_put_tag(skb, htons(proto), vid);
> 
> [Severity: Medium]
> Should this patch carry a Fixes: tag? It looks like it fixes a
> user-visible regression on XGMAC.
> 
> On XGMAC, __stmmac_dvr_probe() advertises NETIF_F_HW_VLAN_STAG_RX and
> enables MAC-level stripping by default:
> 
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:__stmmac_dvr_probe() {
>     ...
> 	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
> 		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
> 
> 	if (dwmac_is_xmac(priv->plat->core_type)) {
> 		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
> 		priv->hw->hw_vlan_en = true;
> 	}
>     ...
> }
> 
> stmmac_fix_features() also keeps STAG_RX tied to CTAG_RX on XGMAC.
> Because of this, every frame with a stripped 802.1ad outer tag went
> through the old vlan_rx_hw() and reached the stack labelled as
> ETH_P_8021Q. 802.1ad VLAN uppers received no traffic and QinQ between
> hosts failed.
> 
> The sibling commit da17990421d7 ("net: stmmac: Disable S-Tag processing
> on dwmac4") describes this exact failure and carries a Fixes: tag. Its
> message says the dwxgmac2 side can be fixed using the RDES3 ET_LT field,
> which is what this patch does.
> 
> Without a Fixes: tag, stable trees that pick up the dwmac4 half would
> still mislabel S-tags on XGMAC. Would this be a suitable tag?
> 
> Fixes: 534df0c1724b ("net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN stripping")

That's not strictly speaking a regression, I'm ok sending this to
net but I'm not sure this is worth.

Maxime

