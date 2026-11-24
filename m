Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2402606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wKMa+3jK;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=PtKiTlTF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tGbWQrDEFsG+CrBMh67TvMJoiGyHK1BPF8UtKJdVMz0=; b=wKMa+3jKohuNG6
	Ix4uuDBNP43L0snFKtHEPnE/TeTdz6+slClAsZ9I7OIxjGKjs8EnyTvItgNkqBxgjJfrqiiUR0P5C
	M3t8Zlx2ZpfVpCULA2E8rVsFNIxV9y3xmGAZv4DnU1tWfhK86+gxpdOSWr//ss5TLEFqnB51eGGlq
	ReSUHpvthRX5VN15J8rWRLUbn+K51SAN2Fw8QYATub775PKeT8W++l9hdTGEpWsNYCL1DfU9cQ8mp
	w6wb9AbuL6B9Z9sZXj5/U3Wo8a6MZ70djn/5oays0c4fxFOzvhhkSo7nTpH2TrvmBW0q+k7tfuXQx
	n4HgnvD/NkW2HHbcMNew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpGx-00000006T2N-1OCw;
	Tue, 24 Nov 2026 12:05:19 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpGY-00000006Sk1-0XS0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 12:04:55 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2520650f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 04:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795521892; x=1796126692; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGbWQrDEFsG+CrBMh67TvMJoiGyHK1BPF8UtKJdVMz0=;
        b=PtKiTlTFiuNEs/+b3+eE+JnmlfR3V/l/4ZGhv2Z0aEFywwKa79CLQrUh4+j9duFgZm
         a6DceKKynjzUUVRWoDSptO4IcvHTVFziBkSjUWVssg9S9SHSPkxVGSTypp0Yh7F0i3jF
         3Tgacv+2YhfDK6ln/JOhtva7tr3dWNn5byP3s75oARuN8mJdZMEpv8+jEMFtbd3ZlX7q
         rFEiILIJbKsVeJCea51/33BdftX5otrL0wlfSk8tHMejoxtuoIwy8C8OQhHNxZvxcj0I
         wf7KVcV2hYIf6KikzLgdHW3o1oGmosI8gN9G8U/CxTCjMGXDDaOGO23wqJawRbKVzd1h
         Z5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521892; x=1796126692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGbWQrDEFsG+CrBMh67TvMJoiGyHK1BPF8UtKJdVMz0=;
        b=VeX4frC+QOa4pNkJM4wzYyG075zFp0bbyOMy+fI6PvP8CrsuOVaNSuntNLgjFdu4O9
         0l2BHsNwFTZSmWWqnQCZZpTzvmcYvMI1thQ5DCeAL6es5R/teu3ogerA0L5OHHhp1DG1
         rdZsT1RRpolUXtJs33SM3kqnySXhLZ49w4825T+a89DCtYkZn1doR5qdHQrMnWAdJOzR
         8qv1SRsJ6EF9f13mPVVD35zs0vxwtahTD+NUyUJu6yg4sTS1ICJjMnZ9nfZzeDwFBYPp
         ESkP1Ql92xfzPK0tmp3VxMk0vewsGappqiV5MPv2/ayFRVNROp6T5Mv0L7DlC04zKaJT
         bQ4g==
X-Forwarded-Encrypted: i=1; AL+hErEdsmBZ0mpuphSaPk8wDi3mTZlfMz4JJzEhEshdX/qomO1ovg9LVefxEGQqXAtEnaZqZgVJkw7e2kJw44gWAV8N@lists.infradead.org
X-Gm-Message-State: APuU4Z+uRTtyNIrDxkefMUl4+3xU2oQWCPmGhzvMXkqzI9zx511ujrJb
	LHUjSiY23rO18R21NySj9PfRRfzgf1S925jl97AxfDmVz1It2jtdV/5ZpIY+BvlFEOc=
X-Gm-Gg: AZFdTZeeWIRVw7YiIBn0IxL5aCrEMwn9EPovZlQ4qqClFZTuk2EbF2VCFxXurOaEaD2
	Orxwgyf9o7wcEn5FJsg7KCurUU3CJnpKBqBnkGCudjMBOJ3ORfI28mQnm15jXZDHTbim66oPr2B
	hIEuNX8n71zVuNAEgTRn70bT+6Q6owKuxEX3ICfudXQ/coaPtgk8ImXAsn1CkqUeinyvLivEB2Q
	hEfss8xjsIhu5DrtcA0WAApKLHvsJKdfDtIaLrKR20OUgqaXQji53LAAgGGc9HXNNcEmWAjwzDK
	1VQgw54+iJGl58pT2uY6UchBv1C4MEiT2istqFj1ZyLMmYk0FdRj/YzF/10uznBgLcgQEpbwpwU
	FxVBeZeLOcFbI0ZeKHD2r5S3qORuchHjCbj4ryaDIGLHL5IAGHZjHBsNKWbNttdPZ7se9KCaFfW
	no6dMspKyebde/n1zojrRD9Kh9B6kyyAco9eRqIYG9lFdBjXxx8QDjdMIWIwRhWKAfGt/uaO17Y
	loZG4LDh9R/RiFP8sNqbCocLtQEf500JPft95WbjjN5kcNOCg2/t6eW7ysnIhs7dTnpcDtC4Hzp
	ExqdntcNIaKoLCtvrBOW0JXb4lO6A5c4fZiQYipyrszjfvtRzYxQNvetCMFnymr3basko6rz937
	rVfAusaYs
X-Received: by 2002:a05:600d:1c:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4bb9de0d5ffmr64185675e9.25.1795521892212;
        Tue, 24 Nov 2026 04:04:52 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm242405235e9.2.2026.11.24.04.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:04:51 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Nov 2026 16:04:32 +0400
Subject: [PATCH v4 2/5] net: Accept MAC addresses from longer NVMEM cells
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-rk3576-otp-cpuid-mac-v4-2-d403b8a25113@flipper.net>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
In-Reply-To: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2474; i=alchark@flipper.net;
 h=from:subject:message-id; bh=niDymIQqvfRIIXXdqI/TGZmfY9YHOucl+/lAZoeizp4=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSz1gZXZqQ0/bSZxXNP9Hn06upbPoGeitm9n4su2avFi
 86+E17aMZGFQYyLwVJMkWXutyW2U434Zu3y8PgKM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFR/ucTIcCVAYtO/Sf5nGx6silzcJuR58W9xqaVavUtavJ/e4iPFrxkZNi0sLzY
 7q6F4e63J1AW801YtWhkh7MP7zerfD2eOxefuswIA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_040454_211195_28A6689A 
X-CRM114-Status: GOOD (  17.72  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A "mac-address" NVMEM cell may contain a longer unique hardware ID,
beginning with valid MAC address bytes. Both NVMEM MAC address helpers
reject such a cell, as they insist on exactly ETH_ALEN bytes, and then
discard any tail regardless by doing a copy.

Accept a cell of at least ETH_ALEN bytes and use the first ETH_ALEN of
them, leaving it to is_valid_ether_addr() to reject unusable content.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 net/core/of_net.c  | 4 ++--
 net/ethernet/eth.c | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/net/core/of_net.c b/net/core/of_net.c
index 93ea425b9248..d4a256521954 100644
--- a/net/core/of_net.c
+++ b/net/core/of_net.c
@@ -85,7 +85,7 @@ int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 	if (IS_ERR(mac))
 		return PTR_ERR(mac);
 
-	if (len != ETH_ALEN || !is_valid_ether_addr(mac)) {
+	if (len < ETH_ALEN || !is_valid_ether_addr(mac)) {
 		kfree(mac);
 		return -EINVAL;
 	}
@@ -108,7 +108,7 @@ EXPORT_SYMBOL(of_get_mac_address_nvmem);
  * because that is the default address. If that isn't set, then the obsolete
  * 'address' is checked, just in case we're using an old device tree. If any
  * of the above isn't set, then try to get MAC address from nvmem cell named
- * 'mac-address'.
+ * 'mac-address', using its first six bytes if the cell is longer.
  *
  * Note that the 'address' property is supposed to contain a virtual address of
  * the register set, but some DTS files have redefined that property to be the
diff --git a/net/ethernet/eth.c b/net/ethernet/eth.c
index 39aab0f8035a..b69ef0eb16f8 100644
--- a/net/ethernet/eth.c
+++ b/net/ethernet/eth.c
@@ -508,7 +508,8 @@ EXPORT_SYMBOL(platform_get_ethdev_address);
 
 /**
  * nvmem_get_mac_address - Obtain the MAC address from an nvmem cell named
- * 'mac-address' associated with given device.
+ * 'mac-address' associated with given device. If the cell is longer than a MAC
+ * address, its first ETH_ALEN bytes are used.
  *
  * @dev:	Device with which the mac-address cell is associated.
  * @addrbuf:	Buffer to which the MAC address will be copied on success.
@@ -531,7 +532,7 @@ int nvmem_get_mac_address(struct device *dev, void *addrbuf)
 	if (IS_ERR(mac))
 		return PTR_ERR(mac);
 
-	if (len != ETH_ALEN || !is_valid_ether_addr(mac)) {
+	if (len < ETH_ALEN || !is_valid_ether_addr(mac)) {
 		kfree(mac);
 		return -EINVAL;
 	}

-- 
2.56.0


