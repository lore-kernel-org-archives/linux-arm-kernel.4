Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E792A606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 18:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LBbOOb8G;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=NLnQVbmK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=; b=LBbOOb8G/xS8Qc
	WuSSpQ/S2TqcmiBG4zdapN9I20KeSRfMoOUoPECvrwPJ/Hy88o+Xl3PNwpcCHicUaAr/+Tw+cZ8/w
	45jWSnQDpii/k181OOGfaPC0FDPCyIXFOm/TtI4FrCG9GoXfkLTAKnTQd/NXgg1jNquDVZplGdzov
	nq1rOG33upz6iDTbWbgTNr+GTozqzSh1XTTZ6OnBS1FBHQlO3xQcT1vMkQ6QWRDblqBFCbRgBlKJd
	AWaJgocuri8hZ+EY6vsYCdZFeMvp8YBfk/u4NrN2TN47sUs8I4+TvpAWkUTej/btJSdcAoO1O/DeP
	QR6nme7YVIZYX7GNZIGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeeg-00000000Jbm-3SzF;
	Sun, 15 Nov 2026 18:08:42 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeed-00000000Jay-2bln
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 18:08:41 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-67da62357acso837434d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 10:08:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794766118; cv=none;
        d=google.com; s=arc-20260327;
        b=fKCDBtDM2Ti6GpOUqUNgj8w48WAUzhKDPnXn38wqRLqSuVZctmTxLe5FxkTkk8dRNt
         5iKfm7WLnVr25c5BYhFLGeKkagkhvKkzUVnqm7lwoE80PpAVzl6WL1ioVUlckGBQ+yy0
         B0a6SYjeNNQctJTq3mJLrmsGnQjUTB2b23sK8Ox0ouAfMk1brQpjD4LdGqylKI1cAJOc
         92kPucuGPttX2VVwxaVc+jgh6chsBZdMGOal44pfgzrBjvP0c80dEzGDE6iWtZ3iEXGH
         OcymR+uKtSdNrlJeErLP+i51bXqR+rkujLTE884QI3xf9V8CWoNVcUKDJzF7EaGeqwyF
         5Tvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
        fh=jZ6vg0AYjIE0xoXXFlJlQ+6Lm4t7nLwGQmeLz+et8VI=;
        b=VCDW6lK7Jui8LbElthIcwTwVfAEME1iX0EwHCsNLQQs3KVH17AA7TfhnMJO0VC5CO4
         FPpV3dWKAPDbK69cb8lzqD7tlBxfehzCAoeiiIUDYsRqHMK+fGZC2EbVJU3yeRvKA3Ah
         DCka2nJu+K984SE8fvCk4mApBMapkLNk8u/TDkDWBxEhqmnLWDv2R5fXGLGiOrrVBUfP
         rgmkX0HsujK++mm+XZ+hItqmNhJs5ls51W6eSeiZUoEw9bgpamO9J4ZFC3rBVvewHOMn
         xMKRpzox0oBgkj54gf8IyjxHDfWwqHMbOh0gXHIh6Y3vESIRz+a2fdjPZMQbH/WD8yEz
         sy+w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794766118; x=1795370918; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
        b=NLnQVbmKvLNOzt+d/d0RKY4gbO6C8krQ23sU9OlhOWZ//2Y6WCja3AOTyzYsEPvsYf
         fJuajdKxED/OUZprvGxm8sbdNQxfjYFfSXg6J0h+rZNJMSgDQE6yNaWE8af8URlXSf83
         TlV++MQdCT+yYkGiWYj00mCE3CHf8dWSZ6B+xd+dgnVGjQJn3SyLoDlW3oHyttQuRk8K
         K9qZ+/TSFctQs80T5Bxb713b41UTS2kWDrDr/9w4AP66N+XmTALBHlnKRZ5FM9ePizgF
         TBqB32kvxjLUouZsHGjTLWapYR8qwFjNTIzd9IIgV8m60164lGArS4i87UDCkfOIiRTq
         ztgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794766118; x=1795370918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
        b=iIyKncIqfGJMby51BzyZYAvEi1KmdN02XLldZ+zvbNnBKZs2CEmHRPyxvs3CXc19FV
         FSEk5b6OPt4sIW6eCI8A+fFWLCczv60hEX7TdOIgA7yLXoEkv2pKp+pEHrsybyjnOGVt
         0uR2CrIHTp7iSo9+eH/CRRrHDuBMQmohJQ7ywhS5cH5zBfxummMvlCgOjhe3/tgCcKJE
         sqe/+OQNO5J+kkWj1SOLPkP9+0GnM5tVbiVL1DKpjMkNoTuKPX1GyGRn7M1v0UkNDtrS
         hmcWqOZooFtOaC/KVSF312VEEbcYiaSVaO4nmHtVYXKqOMBmB2s4aEUwPXq+0bgBu1vH
         Tk7w==
X-Forwarded-Encrypted: i=1; AL+hErEAGL7kpnRMBcb1fPrKqxCs3YjZ2uH42mqpzB5p/+F/mlJOG9U+uuVHOlXwJXwkYE/yPUJopG9uqE2ANYlh5lr/@lists.infradead.org
X-Gm-Message-State: APuU4Z//6pX2grZr4WCrExJWBHo+npDevPGM02lz71ed693owJyj/VNL
	6/nlk8y0GsL7w5iKRQFu94f8EBcC8bNlQACO4NnCT1rQOifiUwCi8RIx9ioQ3U06PsWhLNX+r8k
	/gVeEd1iNTNb4+P9E2z1pcwNQr1R6CzY=
X-Gm-Gg: AYBFou3H9jr8B948Sd5GePS6Smg6PEYpvWdefIFzIgk2qn+KcOFnsHymFFz/32XB6RG
	7niIQFDr04LfsehPut6q8zxhsbO5xEyW6Lz//4diq8T9DoqHJA2PZ6Y1+MHxgcQI+RJXq6VhYiA
	xlrN81ZWD0s4UXiYCG506unBscLe/XUxAiVclMZfDaWlsm1RlUWi2pzQL5ggrhLKwtXlo1ZsDdm
	sJQ5eRosqm0Nn3LhPKHsBNBqUWPo6WZ4nACCt5a9ACFhITaP4PP47XojL+6zuWOkqnXgJ/WTXNs
	AEUt7aYgBRcD6BEb5izhrQxgW10mzvSHZyQejmISq8bo0sUyNTsNlt5oMIulI2V6zKDoguqD6V+
	QE6bI8QWNSEkV0JR3kpNBsajzmi2ysSjh9dGDaZB8pG0s36e2ZEnosD+3CJ+4ED5+6ev+6Q==
X-Received: by 2002:a05:690e:a4a:b0:67d:a6fc:6ba9 with SMTP id
 956f58d0204a3-67da6fc6d40mr1650517d50.106.1794766118350; Sun, 15 Nov 2026
 10:08:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-8-tanure@linux.com>
In-Reply-To: <20261113121852.334604-8-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 19:08:27 +0100
X-Gm-Features: AclHuK_ca4Ke1rBatVDRggo6mUiIuil3NWD_1WvhT9IQ3QzVWOrT84nkfXuKy0g
Message-ID: <CAFBinCBZpruWYPrCWhRY146C9fd6ij2cOirJNORqAJFaiGZJ5Q@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_100839_687498_8A6F8429 
X-CRM114-Status: GOOD (  11.10  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lucas,

On Fri, Nov 13, 2026 at 1:19=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
[...]
> +&ext_mdio {
> +       external_phy: ethernet-phy@0 {
> +               /* Realtek RTL8211FD-CG */
> +               reg =3D <0>;
We've been following this for a long time until someone found out that
RTL8211F has a broadcast feature.
Can you check the strapping registers (or simply see if the PHY
answers on address 1 as well)?
I'd appreciate it if you could update this patch so we can use this
approach as reference from now on.


Best regards,
Martin


[0] https://lore.kernel.org/all/bc8c7c6a-5d5f-4f7c-a1e2-e10a6a82d50e@lunn.c=
h/

