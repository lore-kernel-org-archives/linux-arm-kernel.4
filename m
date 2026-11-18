Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743C9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wLMBSyZB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HS0WspjP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z/in6Go4HJ3XPHRMCUvYGzPNDvTXNSyIYKavm5KQvOA=; b=wLMBSyZBaWq3ldxqREcdgD+sYt
	OlVfIjSZiXWIOzQeSBg+QCCSfLwYJSVkXAuGKmIQpNGioct8N8CtMAm/XMGIPwpPzG8dMU/1ZuTvt
	IcKzmTYUepAT+v3KqF5w2r0B9nzbQLvEZolYw+mglQaYmzxZ8CUJ0XH5kTZoO8P4V6kyf1CreVByb
	Mg4u913oYrHscWCTgZ1Ys+8CdVVb+/Stslc+mwL00UWthPvmGvZ4QbQOiRXNbElucA9iN+KV5tzUQ
	6dnTg4MVADx1OS0B3opPQW002IgHPgKyuBbz7+bWF+GGZxuJF0qtpzdbZ2erkdD/as4pCVR6mJQWk
	85ukypPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTks4-0000000A32J-0e2F;
	Wed, 18 Nov 2026 18:59:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTks2-0000000A32C-1K2U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:59:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 09D4F637D8;
	Wed, 18 Nov 2026 18:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B52A1F000C5;
	Wed, 18 Nov 2026 18:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795028339;
	bh=z/in6Go4HJ3XPHRMCUvYGzPNDvTXNSyIYKavm5KQvOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HS0WspjPH1WYyeQ56SzNZK0LISwQUIcp2gHZVIWc6ofAbLaHPjAjebTzVLTjZ7w6c
	 BB6sVDyk/uH9KDdd10veudeuPeAUstgQ3JKD3KymD0NlX3FBLVRC9yPEytrh8NW7Gj
	 EyZedxyDJ8Zye05oa1ZP6kPBsVsioxK0edIGb2uYjhhMNBkpbxemXVu54o4jcHw3NM
	 29t3NZ4qA1FFcNRcfkmKqwTNtUDJvZUiA+wWBNYQIgvemZ6xgwXtChiIGudoVLVy77
	 eGsFkI2JnZy/hy0Dutlaucqu5n5rHZiBMDJRn73oSQMkqVgJZolCrbR6Bw9j9ioquF
	 wTfhQiVGiifsw==
Date: Wed, 18 Nov 2026 12:58:57 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Davis <afd@ti.com>, "David S. Miller" <davem@davemloft.net>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, linux-arm-msm@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Andrew Lunn <andrew@lunn.ch>,
	Jose Abreu <joabreu@synopsys.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next v4 01/10] dt-bindings: net: ti,dp83867: add
 supply properties
Message-ID: <179502833706.197934.11325095223476825212.robh@kernel.org>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-1-c41902e5f2fa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-shikra_ethernet-v4-1-c41902e5f2fa@oss.qualcomm.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 17 Nov 2026 14:15:21 +0530, Mohd Ayaan Anwar wrote:
> The DP83867 PHY has four distinct power supplies:
> 
>   VDDA2P5 -- 2.5V analog supply
>   VDD1P0  -- 1.0V digital supply
>   VDDA1P8 -- 1.8V analog supply
>   VDDIO   -- I/O supply, which can be 3.3V or 2.5V or 1.8V
> 
> The DP83867E/IS/CS datasheet (section 8.3) describes two power supply
> configurations - "two-supply" and "three-supply".
> 
>   1. Two-Supply Configuration: VDDA2P5 and VDD1P0 connected, and the
>      VDDA1P8 pins are left unconnected.
>   2. Three-Supply Configuration: VDDA2P5, VDD1P0 and VDDA1P8 are all
>      connected.
> 
> VDDIO is a separate fourth supply present in both configurations. The
> datasheet specifies that it can either be 1.8V or 2.5V or 3.3V.
> 
> Some embedded board design expose a GPIO-controlled regulator to control
> any one or more of these supplies. Therefore, document all four of the
> available supply properties.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
> v4: This patch was accidentally dropped in v3. It has been re-added
> as-is from v2.
> ---
>  Documentation/devicetree/bindings/net/ti,dp83867.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


