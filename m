Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBB4606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FD8FAWQd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BkpkKwkO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4tA4R3M1tGeqFN2000iz5S9/N8qTO7Ro+JjVYjnPFCI=; b=FD8FAWQdMDTFoEQI8CJXGYfUjT
	Zr0cwXnTnTk55CoXKYa6nyvan/zJfAYSWh2lf5prh7HhXmpftwONzBErosBwh5SbWIZdWUU/YrwCb
	ohorPpOXbADezcWYtD7OpaHfzDv/hK+A/Vxaj+EerElFk2Gy/KNqNwcNwsRFd7vxf3WzT7lAG+V6T
	09/Wff1eWlf1+7Yb9Tg6FuvMkAXN/dyqgntRoYcah82hOHNJDTpvPKxucEWafYl6/RK9ylpFRm9fQ
	+fGu0MH3Xb/6osZzIjhyVUR8X3bMbQPi/jFjUXlmene1U9t3RO1ukGlUCv1mmRn3do4J5pCMAuSdT
	8+jUs74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEvI-0000000AM3M-2ZpO;
	Wed, 25 Nov 2026 15:28:41 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEvE-0000000AM2U-43pB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:28:38 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48df160bb9cso274981f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 07:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620515; x=1796225315; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4tA4R3M1tGeqFN2000iz5S9/N8qTO7Ro+JjVYjnPFCI=;
        b=BkpkKwkOFZ3rsqkjqBJqpd2fv9Su09D3K8PNU5D/q1zKqeLZwLEILCb0TvWdbIC+I+
         ABMrtHkvGUmtGxI9/L3MF58W9lZgsByi7JUAsWErLfdgfv8PI4BI4Nbb9hfj1MjZ+fQG
         npPVEoQ8iff9Xoi4bCm0D8XOtydErfwCJlk6KIv00jMR3ia/YPJNQbMjyq4PLLBJYiLL
         My4joyoGWo9zXKHkD3ag7c7Lg4mIBgtybZ3Vf78fq1gXppeH8W8eQ1nLinyPIIgyIVFt
         p9iK3L8us4XXSbliHRAhk16+UT8uygXPih+3vOSXZ0XWEKS8ManOWCQ4SmMhexc54qAk
         pyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620515; x=1796225315;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tA4R3M1tGeqFN2000iz5S9/N8qTO7Ro+JjVYjnPFCI=;
        b=R/ULMe6sa2+1UvHold9ZY9dEsil30IoZOz/JPoOq8TCUZS4IEZXYw8usnAlCxuqgb1
         1pE0Mnc0bE8pePkYPni0fZQ1t3yn+mAcGcy/vVWSQvwiemskiMZxBVJCa0oZ1GTTkB3m
         hYH73xNwHfpVXBFC2HHqxcIx5zvUsx8z8DZYKbJ+GWHvJ0Rpfcrsz0PWtnRcJWzZI9Lp
         cnBWyDO3CXteyVyKqD3VnBEqoVT1tWUeUOMwep0f2JAWuFput++xjWc952uyTyvMH8X0
         PN/yqE5KpdrEeb4TkLtpw4QqN71U7bv0rdPCA4UYcvrjJKCep5GHtrwqMsvtUcSPdLnr
         rUzg==
X-Forwarded-Encrypted: i=1; AL+hErFhHVs9niDLf4iuPppVoWEGjee+XJWqckFFPKrHGASczDxOYDJjomguVovWiQGc63sLsv2X+OvpQ0EMcpqdaQlV@lists.infradead.org
X-Gm-Message-State: APuU4Z+NjH1R5fG6gTTroguMHxIKoUQhWQCczDwcaV1XWXkBLMGhGKl8
	aa9PVjXUVkmQ0ckO2cY2MKu8+C5EFNZsljMl9ZwVs6ZMA+HhSNjJbdCh
X-Gm-Gg: AZFdTZdN1wulRg7pOuP9/bFIoEZd73/SWCAjMQViLXTsLMfzSM8bVOgR53WStlC01oR
	FGXhgUNIHJXTtqs19AEUanfwFnop60J0xDQNfoIci/0vRtK0Gsf7gwDgMwlJvRXKRqiwblkVOAe
	KrZM/2MS6I/GRzJu9k7+8WX6PKM3vGp/3/T2RJ6Or4tLOXDjt17httslhe9pfmFBEKKmuytX9L1
	8wAxkdymwYLuWRWd7eFB+cljB+EmkmtanU9Ab+D6Fs71nIOVhUpVnEpZyi80+ArWaBTlZGRRQvo
	OV+6DWNspCW8YHUzq4eeLeKHJyuwIrJZk3P4408Bfv0Q2oL+5dnoxxMCmnpxXixD4x7bhmVhlDM
	L84A8Ke2ai4ZtW56SD7sp8IJCYkOIzebXayIXd1sODDRHVKA86Gv18M93qFDsESbUetqFfvJGzO
	vZdftzbkI8gN7uxAWme4Zc3Cd802vdJzcla2uumL9gfI3M1ypM21aeHj8y2K8YitRaF4Jj/5zti
	hFpivqYtu6umIQqWJoB7mEWp4lUugE24blsdTtRhchH92mmcA9+MrXOqLsDXJElvzT1d9edeGVn
	C8L6us4xaxI5IFT/1tex
X-Received: by 2002:a5d:5e01:0:b0:4a8:eed3:770 with SMTP id ffacd0b85a97d-4abb47b25eemr37771369f8f.4.1795620514919;
        Wed, 25 Nov 2026 07:28:34 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm34443459f8f.10.2026.11.25.07.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:28:34 -0800 (PST)
Date: Wed, 25 Nov 2026 17:28:30 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Aksh Garg <a-garg7@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rhys Tumelty <rhys@tumelty.co.uk>, 
	Manikandan K Pillai <mpillai@cadence.com>, "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Hans Zhang <18255117159@163.com>, Yao Zi <me@ziyao.cc>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 6/8] doc: phy: Document some bulk helper functions
Message-ID: <awb-MUCgZJn94Lbx@skbuf>
References: <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-7-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125043639.249525-7-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_072837_380078_F6074BE7 
X-CRM114-Status: GOOD (  35.78  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 12:36:37PM +0800, Inochi Amaoto wrote:
> Document all newly added bulk helper function, it can be used to manage
> a set of PHYs automatically. This is useful when the driver want to
> simplify the management of multiple PHYs.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  Documentation/driver-api/phy/phy.rst | 40 ++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
> index 0865c2e94eec..cae3d4700814 100644
> --- a/Documentation/driver-api/phy/phy.rst
> +++ b/Documentation/driver-api/phy/phy.rst
> @@ -114,6 +114,12 @@ it. This framework provides the following APIs to get a reference to the PHY.
>  	struct phy *devm_of_phy_get_by_index(struct device *dev,
>  					     struct device_node *np,
>  					     int index);
> +	int devm_phy_bulk_get(struct device *dev, int num_phys,
> +			      struct phy_bulk_data *phys);
> +	int devm_phy_bulk_get_all(struct device *dev,
> +				  struct phy_bulk_data **phys);
> +	int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
> +				     struct phy_bulk_data **phys);
>  
>  phy_get, devm_phy_get and devm_phy_optional_get can be used to get the PHY.
>  In the case of dt boot, the string arguments
> @@ -129,6 +135,21 @@ Some generic drivers, such as ehci, may use multiple phys. In this case,
>  devm_of_phy_get or devm_of_phy_get_by_index can be used to get a phy
>  reference based on name or index.
>  
> +The bulk helpers are useful when a controller operates several PHYs together,
> +for example the lanes of a single PCIe port. To get a set of PHYs by name,
> +the driver supplies an array of ``struct phy_bulk_data`` with the ``id`` of
> +each entry set to the corresponding PHY name. devm_phy_bulk_get() returns
> +zero if it obtains all the requested PHYs or a negative error code on failure.
> +The driver owns the array and keeps it valid until driver detach, when the
> +PHY references are released.
> +
> +When a controller needs every PHY listed in a device node's ``phys`` property,
> +devm_phy_bulk_get_all() obtains them from the controller's device node.
> +devm_of_phy_bulk_get_all() does the same for an explicitly supplied device
> +node. These functions return the number of PHYs listed in the node, which may
> +be zero, or a negative error code on failure. They store the allocated array
> +in ``*phys`` only when the return value is positive.
> +
>  It should be noted that NULL is a valid phy reference. All phy
>  consumer calls on the NULL phy become NOPs. That is the release calls,
>  the phy_init() and phy_exit() calls, and phy_power_on() and
> @@ -149,6 +170,14 @@ The general order of calls should be::
>      phy_exit()
>      [[of_]phy_put()]
>  
> +After acquiring a set of PHYs with a bulk helper, the order is::
> +
> +    phy_bulk_init()
> +    phy_bulk_power_on()
> +    ...
> +    phy_bulk_power_off()
> +    phy_bulk_exit()
> +
>  Some PHY drivers may not implement :c:func:`phy_init` or :c:func:`phy_power_on`,
>  but controllers should always call these functions to be compatible with other
>  PHYs. Some PHYs may require :c:func:`phy_set_mode <phy_set_mode_ext>`, while
> @@ -172,6 +201,12 @@ PHY framework provides 2 APIs to release a reference to the PHY.
>  Both these APIs are used to release a reference to the PHY and devm_phy_put
>  destroys the devres associated with this PHY.
>  
> +For devm_phy_bulk_get_all() and devm_of_phy_bulk_get_all(), driver detach
> +releases both the PHY references and the allocated array. To release them
> +earlier, use::
> +
> +	void devm_phy_bulk_put_all(struct device *dev, struct phy_bulk_data *phy);
> +
>  Destroying the PHY
>  ==================
>  
> @@ -221,3 +256,8 @@ DeviceTree Binding
>  
>  The documentation for PHY dt binding can be found @
>  Documentation/devicetree/bindings/phy/phy-bindings.txt
> +
> +Missing Bulk Helpers
> +====================
> +Currently, only a few bulk helper functions are added as they have users.
> +Function not upstreamed can be found at https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/

s/Function/Functions/

Other than that:
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Thanks for updating the documentation, this is appreciated.

