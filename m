Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B430606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xqe5A3yd;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=CpJ3qOu5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DUElJOH9/l+/ko03UyVUdQyQrHZyxIkiDH011xj2Lsg=; b=Xqe5A3yd6q7a+B
	hWCSGNwfqBgoyX/ZOWeZIncDp0jtSnu6qkE/p7v+lVpg09gpXQlf4154577+j/EQ4LGgGUJcEdvei
	EAgI5hF++MJhP4pySjBRiA2OGAhUJ4LQljLwq1YULhV2EueTO1h2QVqgov0BsFZdg8WcVOL2hc1XE
	77wm7RbbAowD6IbSRKypNO+p2cfinf8iUWnKpULRaCa7TEN/JopOJAxQkNaFzgwzT3006OAb+NBkt
	ZAbigfkOvZZZE8ApyM4ksYfkrLTBYs6XUcQTMCoU2LfKSLa+aadukGFKVbKZ0OOD3gwB3UxWECu/p
	FhRfnpUSN0Q6EB+dAnQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxTZ-00000007mp8-300t;
	Tue, 24 Nov 2026 20:50:53 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxTV-00000007mn8-3E4E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:50:52 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-8b4e246acc2so35918947b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 12:50:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553448; cv=none;
        d=google.com; s=arc-20260327;
        b=BvQ1iYMi7x/HRVZDmJO8deyjLryZ7sLKyW+4aEsdLPAne5RVGC5hHKqS4dXlnQBUb4
         LZvFgHZWLuyaSYkEP7q+zqACKL4CVezfOUq2nJyHGrLkGUxouDLGX8bg0Z4KwxIRRlYD
         ebWR7oWx0w3Oq2YSYVN4KrZ1ODCna3RdkiOBamtsYsRO5dQWIPebHk/T6sxjAtIFzCSn
         NcQBtzbc0xHul0JuatK9WgKJbpZPMOkXO8+FYfFx/Z2od2xtzFS54pxqP0U3NE7sKsBR
         lYwaL85DN8xNlcdF1q1uYwzcppzeVNoHhrT0dg4ktH+DvtgxBthEgOZHWz83JJBVIuIB
         iRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DUElJOH9/l+/ko03UyVUdQyQrHZyxIkiDH011xj2Lsg=;
        fh=IeIjwL0HE1zjudE8CvdUvPX/2KS3px3cJb0pOvTqS6E=;
        b=bzIlJACgbrjCxOvbUEnmoJDuDa687BqrIctup5TfWS0XhT6tp6zAWq5dmh+TfAiaee
         gviwoiFuhyof22Kan3nEpgd+jp40GujMXJwbYpN03S23I304YpSmvgFWKfOkTHwaNY+B
         sGq+MuQowW20TkJYVYmMlElic7IRveecmShCpoV6EKWNwUF71tOQ6sgmKWz141Nfhwkd
         gr2fmrurCgNskiSx0y0g6jt7wd7yAhTIJh0mTfhOZsjjspjCYf3d4lnGI8Dgl3jjaQe0
         VmXRHg66UAicSshygtO3u8rPhz3/QrUZndQoQtzeDoebPJ08bA5t4Vtx5EXaNTcnVgPr
         ENJQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553448; x=1796158248; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DUElJOH9/l+/ko03UyVUdQyQrHZyxIkiDH011xj2Lsg=;
        b=CpJ3qOu5I2nSmIwepb6X0oT5QEEQJeN/cQbUHDnepVXroOOSrL7R+pujvt14GJBsDG
         JxI0wRE1lhM4QZFReBh1gQKsViR0iutBJYPAdeKr9Z3I12CfMsfcMXKip32SeGD0FMj0
         ATHWbIA28VPQSB9VEUrRR/1UjzezPSnD3y4ejb6SgplPZhw+9OTrdP8ulj/kGfTTwfdQ
         hlk/rVfage6H+he7Ha92VKffn6otthTvjgx3ypw7pwjholXwK5POIz1Dch2l5VM/K8BY
         PJ39oWa8xdyQ4zmu/9RCYm5+RkCb4hEdpyN4nG51RPh/dEjOFjTAh73Es/PHsvi1RyjR
         J8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553448; x=1796158248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUElJOH9/l+/ko03UyVUdQyQrHZyxIkiDH011xj2Lsg=;
        b=X3PI4evYbAZy2bFIIbJ1TEOBAUk8vcoHpHNqXlb7A/maMmIOUdE4Y9S704hQ2BfT6W
         GJqgAD7e9Zvo/8LSkYY05QEdpaX1KuoKygfvVH9dLaORP+ggWz8H4UZ1l3jyLeEEjKaW
         vgkfPc2/JbQk5+vkHOsmovP3t2vsZoi94dcPvGbhGMmzM28TIZNR8J7AoJhh4mXH0A7J
         nSqkKTsy6Y7oSDyRWlisT0l0+IR0zHLknifryQAk0+1LNl2BWWiTkCNWpQlFD6JIT1YV
         sSNJUxeebM72BtqO09bTUkh6pp27XPo2BFnMvVMSYnzrFlY21zDNGy4zbuHOwwirfGbV
         xUgg==
X-Forwarded-Encrypted: i=1; AL+hErGbtd5j9GF1AxRny7TwHY7XqHnLWFsXcv+Klbk4Sewi4A4VLJxzPwFYrn+wOJ4TKv82OTIJAZnWQmHKpm4wMhfi@lists.infradead.org
X-Gm-Message-State: APuU4Z/nmSWf83Z2q5Tai8hdwc1EjuytzJov3Ah3g3Re+W1IuM3odW+8
	vbRAFqnfRXDf7EgYL8+VVC0h3wYrAEd0RkQ/GUHW69Pg0tXM3WYJ9PBc3NJQAcbEGFI6GAJS+Kg
	jSC5QJsavUb2VE5s2X7woyZIH6FCVG9s=
X-Gm-Gg: AZFdTZeMRWtrPTX4EeZfSKeWR7vM76X1PHhUJYKuPIHtbusc3Sa25Z5g38r+YUUQBRR
	9srquoa6UCSKNmivPdE8G+gIxZoXu2w55g2KKFtJZtA2m6oZHMLeIS2m2ybwQHqhrcJhcu2yoRR
	CgV+8oS53FJ8PUMuh+S1gBv648Idf4QCPv+6htghezliU8GGdF+iFGD9dmDuLrT0aOr5ajOATeP
	8WbLUhjcSlzN/VNp3OONk6agVIAwK6R5J0rrZ/DwnYztaCn4AVGqbDLaxFSLE7NZhqtpho8DYMo
	r6U0H5lyU14bdDsrYij7om6G49pCZRwsEZc3WWONi51E/ZkoE0JHOUm5A1DXfhdw58ZPjKdSul8
	rmAY0q7ZsSL+6aUjej+gSJmexbHkzTgh5e1w5SeNWLDX35dwBYHKyLFkrYEIQMNkQkBAq/PwgC9
	Te0+7LcaN4xQDHDTY=
X-Received: by 2002:a05:690c:9c02:b0:8b2:bb94:8cb2 with SMTP id
 00721157ae682-8b5204ac257mr64922377b3.35.1795553448224; Tue, 24 Nov 2026
 12:50:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
In-Reply-To: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:50:37 +0100
X-Gm-Features: Aa3M54qQgZtHIRJ2rEKu9YwpwMfEmR_bHT9xQyRDCd8xOxY9i9IjLVm41ypmXlU
Message-ID: <CAFBinCALe-8oB5Mwpyx-B_7dKJ-WZcMCjycHv=xH+JasRBOaPw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: mdio: mux-meson-g12a: keep the MAC data path
 when switching MDIO
To: iav@iav.lv
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_125050_179866_3AFE2168 
X-CRM114-Status: GOOD (  17.58  )
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

Hi Igor,

On Tue, Nov 17, 2026 at 1:54=E2=80=AFAM Igor Velkov via B4 Relay
<devnull+iav.iav.lv@kernel.org> wrote:
>
> From: Igor Velkov <iav@iav.lv>
>
> Switching the mux to the internal MDIO bus writes SMI_SRC_MAC together
> with USE_INTERNAL and RX_CLK_EPHY to ETH_PHY_CNTL2. The last two move the
> MAC data path and RX clock to the internal PHY. On boards whose MAC uses
> an external PHY, any access to the internal PHY stops reception until an
> access to the external bus switches the mux back.
>
> phylib suspends and resumes the unattached internal PHY across system
> sleep. stmmac sets mac_managed_pm, and with Wake-on-LAN in the MAC
> phylink_resume() does not start the external PHY, so nothing switches
> the mux back. On ODROID-HC4 (RTL8211F), after suspend-to-RAM with WoL in
> the MAC and an RTC wakeup, ETH_PHY_CNTL2 stays at 0x260 and the MAC
> receives nothing while TX works.
>
> With the MAC on the external PHY, SMI_SRC_MAC alone is enough to read
> the internal PHY ID (0x0180/0x3301) while RX keeps running; adding
> USE_INTERNAL or RX_CLK_EPHY stops RX.
>
> Set the data path bits only when the PHY the MAC attaches sits on the
> internal bus. Look the PHY up with fwnode_get_phy_node(), as stmmac
> does, so phy-handle and the deprecated phy and phy-device all count.
>
> Fixes: 7090425104db ("net: phy: add amlogic g12a mdio mux support")
> Signed-off-by: Igor Velkov <iav@iav.lv>
sorry, I'm late to the party.

I have just reviewed Lucas patch [0] which adds Ethernet support for the T7=
 SoC.
He kept the internal MDIO mux path disabled by default, so boards
using it will have to enable it.
Have you tested that approach as well? If not: it would be great if
you could investigate the pros/cons of your approach vs. Lucas'
approach.


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/20261121213102.143130-1-tanure@li=
nux.com/T/#ma3b325147d6277c4d95dff83cf5bfcb75c1477d0

