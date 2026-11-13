Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A76606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 06:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mzvUGtkC;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bDLCJhy5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oY6Sw2eupDcreXCwLDckh5hNjgWiUywnz949Uvx33tA=; b=mzvUGtkC9+LO2O23VLQC94irgi
	30hQ/+BVGYagyQL17kk3YcrQCeINO8+5J1WUs6I65l2VuopdnyCDzpVOsVEAJsP9QIXjx7XmqLCVN
	b0jEOlQlD4iQOvyIYFntE0Lxim8lLv7MI9Hv5444fKT9XkTvejei6a8nLcbMFTzcXF88eGjVBua6T
	8VGyBlq5ANNPfgmb/A6mPmP+/6mxGFpGsfWo2g0QbRdia/jnQ8FUQuwMc+8wTpeSt3bj3L7TzhuHD
	yQ7zbud7BwmwkErANBpmM5gfwyfrSF6yCvcvZ+sHOLKfs+8h1ZyF/AWemP+XimCeNWKJMOuP8om8W
	woX764QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRktU-0000000BmwM-3Gl2;
	Fri, 13 Nov 2026 06:36:16 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRktS-0000000Bmvy-0GVx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 06:36:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49d05d51553so2411295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 22:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551772; x=1795156572; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oY6Sw2eupDcreXCwLDckh5hNjgWiUywnz949Uvx33tA=;
        b=bDLCJhy5CYckihG8h+Lad/PePGs/qS+RelTs8VD5pc47NISCMNUQQSln6FhduJTdM3
         uYrr39dYZD5HrSes6CfMom0fp+0AeF2k9XiTIngye2XhIG7wC/ghSHWz3B3WUoCaJl7d
         gmKRAp0XoRCAFkDjLdNno3FVSPUeelq84Dxuxp1chlBoeXs1X2wji93oZ8nY/6qBioGz
         YUK2U2lKUOWMyjIkH5h4J2n0J92isxWCBM4i5RCamOERtdb2AZzKZ4ovawsU3dYsa3MO
         9mG2QqZMOkoQzYS6yfH8TftMgobdubwkLT7eHgDBo9z1c+LnTSHVW4fmhqQvK1MZH3ea
         keFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551772; x=1795156572;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oY6Sw2eupDcreXCwLDckh5hNjgWiUywnz949Uvx33tA=;
        b=YoCGRHEhviIbNbCFKShJEkWJWuEBh+yTr0sEBQWGxx+vpzCPKT8SquE177E4vOLrlZ
         U/bX7UezyFnPKVjNVvC7Fz9CYdhLRFrCaaS8rq0FmD0EXSC/zL7p5AKrUWixxh4wpXuW
         LvCs6EJrTIXbnaHghPoLOYXR9GsW+HQ4lBVUGUSVD4tXCqknvr51xFMkpy4SB26su+GU
         akuQSXk8966HhEAIlscn6jOGmno/bf0tDOf/Xn/2GELNEyGnKFXUd5JE6X6J4r12O8hv
         FYVyWCLCztM4ADcFw5Xp68bJyTM4HyIbwDbZ+1sCHzlB84OUpSl64ZJEkSxckORR/RVO
         u6wQ==
X-Forwarded-Encrypted: i=1; AL+hErGiLbZ0ZUEr8gsf9QTxCzJRe/Eghf2NOY/sYIV8XfGJ3pSy2ylEFbbrDfDALYY+nEM5dkqPmVMGcDrBn/PJ/DM4@lists.infradead.org
X-Gm-Message-State: APuU4Z+5xdJVF0M+PCqOZ4Lpi4doyfEx5uttS6rOf5+W9oCVZ9DN6OxB
	cBj8/8/eNKRAMEHYdsRNYuqqRNR3Q8iynkjS7zBMnIHRAJ0y7fUCJHEOJkF0H4CdJIY=
X-Gm-Gg: AYBFou2WSNNGvxSfxVuHhMy8WxxLOKnGg4aeysKqttqZbTd4gQBWp8JSuCjPmx4hkYu
	F6YxHZDuv2sgo7TdjMrbjHrSeVgObfll0cQYFO9kTHDJ7Xz85nryGrkQq/Cz0mn6vfxatujXCa9
	GuaeCZQ0EyJKsZPFZnkfTiNMVwZWZ+gPTvp/zx6mk+c4oHUQNKJ0+E3Y7K2bb3+PEJ6tzLfbK32
	Ukwm1RQH+A11yEttLPVCIXEKS9IaOMmtXvf0hOvWHvq6zk+DdoHJwX5yzUW4ZnQsHs/4LbO9hwC
	jwV794h6Dc3g0l5c97Dh68FB81dq+PxjiZEuDJiqICT0x+cIYJZauPQ5+gbFvRe8yqYLeQ47TPZ
	msGL4ZaYxoTX/+LFDeCrCXg7Es9wRT5tetHvlstOHZJAsCCWp3CkGay85QuWE/txOK4bmu9XEXR
	Sr0lsuEkcAdcwkLAmcmZjc6JTt/mK+sMXYjm0VAaFE3wd9xaE2ieENj5v3+HyBmbGHn9mI12DCu
	u0XC4+TKTsQeH1BAhlJ9GbU+QJtnOG+7Ur+YRPg8dx5YjDWgGccBb9cmAYe+sWci1UKvxR9gctO
	NnJWo8wZRfGULw2EVyqgClbnjY+qpGeEGw==
X-Received: by 2002:a05:600c:a00d:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4bb55aa854dmr30515515e9.33.1794551772311;
        Thu, 12 Nov 2026 22:36:12 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c8d286480sm4583537f8f.7.2026.11.12.22.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:36:11 -0800 (PST)
Date: Fri, 13 Nov 2026 07:36:09 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
Message-ID: <avavgGbj8WupEstn@monoceros>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v2-3-624559bb8ec7@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gkwqr7dnu5cjjahz"
Content-Disposition: inline
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v2-3-624559bb8ec7@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_223614_118938_5AF25B3C 
X-CRM114-Status: GOOD (  10.43  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--gkwqr7dnu5cjjahz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
MIME-Version: 1.0

On Tue, Nov 10, 2026 at 02:10:23PM +0100, Gabriel Fernandez wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/mod_devicetable.h> introduces a lot of unneeded build
dependencies and <linux/platform_device.h> already provides
of_device_id. So please just drop the former.

Best regards
Uwe

--gkwqr7dnu5cjjahz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2r9YACgkQj4D7WH0S
/k550Af/ViscKIb63+PVQx/zXwL2fH1N+c0J0B6+Wy1MxiLTwJFXkjS0mu9bkBlw
CLifRBkJubxD6KiW9nuvesALuaWyKACFL64L/M8rnUTgMEQtIzbxaJP1/fdakEdU
NGqid7VZx3OLkHgHRSws9AOsMV6rJAKvG29HF2mjA7Sr100t/T7kfAskHU60dDRT
oooiNIkRAXDZzowGQREV0WePP+KhHjYDXNY8XL8kp5fc5oxRJxUcSTCFZCWxxgT7
Y7FkmxVSxQA07Pn07yy0KF4rBoj6O+JrpsfW1vJ25VKLi4BaW4Iyl/EMLXHhi+rS
IiIDqmj4rco9HRt+45lVPGX7qe4gPA==
=gLbT
-----END PGP SIGNATURE-----

--gkwqr7dnu5cjjahz--

