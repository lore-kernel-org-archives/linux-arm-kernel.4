Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDA7606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 07:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bjbTdqPb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fC/Y8pNP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tvPQQMwBZ/Lg3SekknzYW0QsE4BK2jGjRwomhq4ONEc=; b=bjbTdqPbPD97kwFb73jhndRvay
	oocrIUzIQ712uuIEqbd4oZeGFAEOj9jkXghDaAFCUhKrTsxiRzY/UVvnS5gValrqgTNzfMXrupmCg
	G6d57U0a94yGHGaoZy2UE4HGLl116nQwXRNiExF9mDMLqRCAoeOJli5ApEXI2zW9sddSno4V5VaxB
	SkuUi3yY6nUjjwmUi39FOHny9lpKStBiArXDAygtRkFDmMxwZQBI72E/kXuHRsFfrZ0QLyPwEDyVi
	ER4z8VrlJfY3Ul/25LkyZlveyYSNaKZR5XapJOhFaV0BfvHZPoTNgD5j8I6psXs1v7lUBOl1xqnfV
	FYnenJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlz4-0000000BwDe-1iEt;
	Fri, 13 Nov 2026 07:46:06 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlz2-0000000BwCn-2e59
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 07:46:05 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5c05727a58aso54172e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 23:46:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794555962; cv=none;
        d=google.com; s=arc-20260327;
        b=WVGih36SFzm42bMBpf65YqNkORvnGaWJw1lA+p8EAGIavezDWrxzmH3S2ufaIxHH3M
         sUE9V0AZk76idr5MgXX70V6d7a6vVy1uSrA2BlJVCdHud5TFV3PfvM4stYlAnhwXerTs
         gFrl1w4JyMFC8HJMN8mmgHuGftBm5C1HIquHXCJI2uhHPpwaDiz0hBMz3sTGNcYL349H
         GckomAkock92u57W/lT+MzxVcXKMjnvH9+XrX7KRZUE42zUzmU4cb7WQJ25UWclbGLj9
         oSFEYG1wuKJu2/X4ITl/NNYNzc2PdIVNqQDTm5wsdBWma1c2R7uBHIdAx2jaFkfWpdmD
         mJ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tvPQQMwBZ/Lg3SekknzYW0QsE4BK2jGjRwomhq4ONEc=;
        fh=M3w20rF10ilUMRER8ykSGHVtF1499KKL4KM7y4Skb+c=;
        b=GJHVl3TfYm6NbdqgPV00FsKL2VkKkpJSPbKlyF6EXmwI7kb0BjRI/Mx+2ccqz5YDlG
         kHGQ/37lg2ghcN5KjYfPcctnWqAA7JZRWDRg5GB/acVpce0hi/uYoKZ23gUSGMjUYUMR
         ZJcW36nVLau9qi7N+D3EMf9SgU4i8JJkQimrNGFBDqDo9XPWz3xKIivhGd69jEqalmlD
         rao95F7P4j2PrqhSX1WVKj9BuCY8Ib/7ATM98692PUbU4YrR7i31c0xF69oGHoHk4D+S
         racB2pZJbcxZskLdQh+MktmGOo+LpB/JnG0GudwwzepO1DDpdo07IrDR9sK/oFhzNXQo
         u33A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794555962; x=1795160762; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvPQQMwBZ/Lg3SekknzYW0QsE4BK2jGjRwomhq4ONEc=;
        b=fC/Y8pNPU/Bk3mQpTIR74lJdERqU4f453hz2UrsG2e9PuS2tz9tpet4YhzboTcE3Sf
         E5PWga3KoUTxZ1IiyG6K2D0Ehw19MEBBSjz00Ch2O+kSwGwSzqOYuB6SGkpRf5+eHimE
         p4jQo1iOjB5p4bDztTkGbb18U8CvFzLXch3aOkmluneXRwhAsn6z3fvQqq04vUjo/N4S
         cz88pB/622dTljt47nDZuVnpiOLacjpaTftRjaIrp3bZ+NJjE8lf6HAIvZ4U/9FAbM5C
         VemG3TEJdW9sY+7cIFMAjp3M1euuAdaxHAgw5lKbhbrvfSJrGWTgY4/r00COsdN+0Qk/
         u+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555962; x=1795160762;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tvPQQMwBZ/Lg3SekknzYW0QsE4BK2jGjRwomhq4ONEc=;
        b=TLqP1dcqLzYhdTLK8JsDgKTtW0B3Gmm65ZdImDzm/cueA+2YDDO9w76Aylvf9lX3nf
         ZGuCmvv5+Gi+uLgJn7uA+H5U8OZrHuqOU+O1VTk2byvT1b75BSh8IJWVD13ksrGwtc9Q
         9C6l4anwVix0mY/TNmcVG65EHKlNeeriUCEdXLnlIz4k3KsMjh1/f+UFEz5ThPToRqiI
         LxQGIO+gFWacc5dTKvhpV4x90O9MZH7w2lsyUx0XbeeRJNO5zwB/E0yzRew52nct+Lqn
         VYq4jOIZuwGFejtwiJO4EKdCfj7zYRwoz2fBuAmBgx2icnCcKD2uqTxY0TPFpfVbtUHw
         MgIA==
X-Forwarded-Encrypted: i=1; AL+hErE8jzYaejglI035cKeAgb/HyMXKmxZOl3Toy4lpw8JrXU9KqskBNEnS8T6Y1+LZli/v4pTVrNxzK/bh3ti5R1Xc@lists.infradead.org
X-Gm-Message-State: APuU4Z8zEqN9DPXFlJbyjWWLpB71XRbVDXmEPRzvVFrXtH6eJhW2VKLu
	LP5EBkZ1hEgCaQaLy97VSgGyEkTEcxIHbkxbKe50gajAda3RGlUI/aC7BFhin3ZAchpgJ5UhPTG
	jATrI78s2LZ5mwDnphjSp04IxSsWiKVQ=
X-Gm-Gg: AYBFou2CJAYjyd5esctQJIhk0D1l3mA0MF9GKJd+Tl/c0u1VBwzPNPxvxW76kwt66Sn
	3Afr3k7HHC8+XfEsdSzl9Pal03gapayv0LD4NotE/lc10NH2U7pxf8X6lU9H31pK5ZFfCm2EL6q
	JCgyAWufzg0ci0NtLVOFHTp4OUCyIYiTcWdznfF7+/TdKnp9B1/51KwcftLxZxWfXdSSPtr0Pa1
	F5+F/hrfxbNvyPDJo5rklP2c/bdC4WAvCJ3fZ+Lr7JYHnh/ljyk2InrRcxpHy2SmzGFgeydR+jp
	jLZ0R8eggzxpzO0iv7SB6erZ6H9Ti348v/osKN8t0P3VT0f2yiG92xLHz+ZtGFVjId5rYC9upHN
	oFVe4r+ADc3v3Ck8jhK0PqM7ETXANpO08IS/L4kw8XtHpWf1taJ4uELm9fneSkpJ5o3L9/bo=
X-Received: by 2002:a05:6512:61a4:b0:5c0:465:3fc6 with SMTP id
 2adb3069b0e04-5c1709ce71dmr805206e87.4.1794555962280; Thu, 12 Nov 2026
 23:46:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-sun8i-emac-mux-uaf-v1-1-308ae7e6fcf2@gmail.com> <e526541c-f91a-484b-a677-4c55e4a96a7b@lunn.ch>
In-Reply-To: <e526541c-f91a-484b-a677-4c55e4a96a7b@lunn.ch>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 23:45:50 -0800
X-Gm-Features: AclHuK-IYiE1aDGEHibGFo-Q3L4DjiCYZIfUZ-5mDw69KYbW_QlhkXjxqGYSAjo
Message-ID: <CAEy9hNX_E0riGS-TdDogDWMv3-fpAVFLAjx8F0cvq4Q_rH3REA@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Fix use-after-free in the
 MDIO mux error path
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_234604_709624_CE8FFA0A 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

> Does this bother anybody? Seems more like this should be for net-next.

No user report. Sashiko found it while reviewing another patch of
mine to this driver, and I have no board with the internal PHY to hit
the error path. I'll resend it for net-next without the stable Cc.

Arun

