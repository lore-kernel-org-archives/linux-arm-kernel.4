Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508F9606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o0Ti8IEo;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RttVRPY/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=; b=o0Ti8IEo8wG9KgtW/SJT59pYeW
	nZGL12xfwmgaNWa3MoP47p6yBizboHlF7c1t9shDhOEi0Qhm+Mj9J5akURiMw18KlrIhHuNlesErC
	mi2s7iChH3xXpbZA3k5HhhdFa7AHM9iTcuYR2Tci6XFEoP1JOp5zO3qf7GvaYY88tIC0jx4pNb6t6
	w9lHsnuNEzIK52CsWYh5BChnXf8MEI9nN8MuyITvrGnlZZr1RtU217fImyer9U9m/Drbox2f0N0DR
	5Y80bU6GOx+1Rpwqk+Z8/w+XjhYqNQNoejvLUyTwF+8vx7exrlh7lVzfqbq+oEBx1QE1ZbCsItega
	1tXwagpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSziN-00000003HCt-43fn;
	Mon, 16 Nov 2026 16:37:55 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSziL-00000003HCA-3YfA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:37:54 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1758456f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847072; x=1795451872; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
        b=RttVRPY/IraL+ZOZj0Z7FabonHAYI8hDdJwqXUUdNQWzm/2/DvcF6IiJUlv4gm3Y6Y
         tW49usBu22lLjR//8tBnY3fe8zGD2AFyuEtMonCMJ7jfixsWqOvIOkEsmABxLYz5oDlG
         V22CRt0UNfKjc33JsLJQkK9TY4nj1HNAc1wK2bLeWTeFVdIkHKqAsq8ATffWI6nVhMBn
         qZbHqsqzwzoGDBopp3FG47U9GhHbVzWE55LdIhouThkG0spHml2MBBFJK9FCNfv7RIE3
         ioMDC28N/BBwkLumCVRRX7bMoy9dzfYeTTpunUwYtuKd6qQoE+2TohJPCx54kVDS736E
         rX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847072; x=1795451872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
        b=snIMmx6RS5X1UQ6wFgYMlCaW8JZ9bDQSZ55WHI2Euo6RSGgEnoxTEYOiTXa4wgvgbk
         z+Gzye5OAQjYOe7JHf8l+l0E0hlPBvhFeEKouG851oAd5oOIHd8BuLSvZr8fWpS1hy4/
         87SKJu4OZI6hQVYl0ZarkyW3lK7KgTavle36NZomIWjWXOIVx/L0aEy4vjY7u3BZqcaR
         j0SUOZ00+ku5IE5hQq7j2XYYbJJFQLg9FCWec+vSHC65Y9l89hUOtPitHRDxECvHO55Y
         becQWhCsGCgrEKSotv719QQJadExn46URs13D1d6wdeeua45DM2rXWRFu/cw/KA+svWU
         rbwg==
X-Forwarded-Encrypted: i=1; AL+hErE3nCC3XHBtmFuJ/TTEUDHQCqMC1CCjIAlyV/JXdegCsAcxRmSgdyWZIO2ypby9nDLpGV5Y8DaLSi1D0vnmR0qs@lists.infradead.org
X-Gm-Message-State: APuU4Z/oVrH8G4doEaQKKzrjALDhV0mGeXmS6hyMfeWyIhPH9U7a1NEk
	JLWv5qIN+G//QiU5a3mLb6wcrR4VEcrXJ8SCosCrRCokZiphl8jYE6Hs
X-Gm-Gg: AZFdTZcHrpUS1DZVXiH1BdbZGsI8N8SkLT9TqpJEtSlP7xw0exvRGVxwYh/X4D2Sf1t
	kNUbkA2q9hRL1vpf59i0fFWB51iXR07pxvmdK2O3dWCzOIiQp6FE6iG4feelmEEIWefTo2ea10M
	Txbsd02tyeLif+jvyovxZ12lMj0YfZS+M1d70gjJEpiaoG5k5BTV0iU1shZCBR+/hFbz4f1yjad
	TXzZ5AkPR0vYmg6AQ0d8BTuXEoed4uh0W6AvaWvpjaq9InZ5R1oCBCksgX7/ZbHXDbBa2My77Fw
	wHeT9OsXYbmFD4feU1CNhgwwcvkMlMtiC1rTuvZ0UZq0Sc2tkIiBLpf7eAy3ZELFTuCi8GUEn6Q
	/a0OEG3fc4mhvVTP7oyIuo+pWCcaMpMNq9oAtgF4yBArFz5/o/8BkK4mk+QcE4WH54Mt295XoKS
	g+f9shZFUrm1tZMb5qBIolUpcmvwvfyphRH2gAGpTE8Cu3zD3dxDfGyi8btvJLDG75r1IpXcx9n
	5xpZqOo/3asr7rY/z9xMuxr9R5AXsYJHMZtO0GxdFSAYITqMbvdFvTdDt8SrUaZAqmj9qrDm90V
	zyp/SC6O91uy9y6hEZERdG9rcxrqcOpIfzCXdSf8q98SuJfHRROEQCRm9lVFWfRneExe/IzLwsg
	u5JvNny+mid9og8c1
X-Received: by 2002:a05:6000:4289:b0:492:b221:ac38 with SMTP id ffacd0b85a97d-49c7381b4e2mr22865762f8f.26.1794847071978;
        Mon, 16 Nov 2026 08:37:51 -0800 (PST)
Received: from Ansuel-XPS. (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm25103969f8f.0.2026.11.16.08.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:37:51 -0800 (PST)
Message-ID: <6afb315f.7f974077.2e08bb.6940@mx.google.com>
X-Google-Original-Message-ID: <avsxW86_xeNrm6Dz@Ansuel-XPS.>
Date: Mon, 16 Nov 2026 17:37:47 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v21 07/15] net: phylink: add capabilities helper
 and track modified advertising
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
 <20261116163412.551438-8-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116163412.551438-8-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_083753_922590_62C232A0 
X-CRM114-Status: GOOD (  18.76  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 05:33:50PM +0100, Christian Marangi wrote:
> In preparation for PCS release/late attach, it's needed to introduce an
> helper to calculate the capabilities after a PCS is removed/added and it's
> needed to track the advertising in link_config changed by the user compared
> to the originally one calculated in phylink_create().
> 
> To archieve this, introduce dedicated advertising variables in phylink
> struct and update it when the new phylink_update_capabilities() is called
> or advertise is updated in link_config.
> 
> In phylink struct the new advertising will contain the full advertising
> bits right after a phylink_validate and the new user_disabled_advertising
> will be the mask of modes that were disabled from an ethtool ksettings
> (with the parsing done in phylink_update_user_disabled_advertising()).
> 
> This double reference is needed to account case when a PCS gets removed and
> attached again to preserve user-defined advertising rules.
> 
> phylink_update_capabilities() will calculate the new supported modes and
> the new capabilities, update the full advertising in phylink and restore
> the user-disabled modes.
> 
> phylink_create() is also updated to init the phylink advertising and
> link_config advertising.
> 
> phylink_update_mac_pause_capabilities() is updated to use the new
> phylink_update_capabilities() to account for user-disabled advertising
> modes and update the full advertising in phylink.
> 
> phylink_sfp_set_config() and phylink_choose_sfp_interface() are updated to
> account for the user-disabled modes, first in the
> phylink_sfp_interface_preference loop and then on updating the link_config
> advertising.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

This is a leftover from the title rename... Please ignore.

-- 
	Ansuel

