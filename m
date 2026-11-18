Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBBB606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VACSkovc;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XmUZ4dk0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hpSIJOUQjOP0Sdyl3LIT9vfFufPLepKEgm5OjTXs6D4=; b=VACSkovcwnu9TS
	ORrZgRpt5S0WLY/kE1GxuOo1oTDZ/qS3q4Hg0Z7jlY2qUece1nFuScaavn7er28GF3EmqwJhLkXwW
	gGNmb0V4BPjmQ8PAZUF3k4mTnLRlqd9NQKTjZ856fCL3UlMs8btfyomF4tndYD0Z7JAMxgx9eC7HJ
	wiJPkX7JsJwv4IKDxCCQBSva/GcImUYYjKP2xg+3pfX0a1kScqElqNBvv9N3W/Rn3SY8bob3vvd+E
	hekM0au2GYB6K+K1UMCca2Oug6jhGLfqPpFKNVee/DKOU/4A/kVKrtJECs9wENBdRTYLYVv/4MnUq
	CJvWIcTM99ZPWn1HRVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYeB-00000007njs-3qDj;
	Wed, 18 Nov 2026 05:55:55 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYe4-00000007nei-38rH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:55:50 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cdb2fcaafb7so5134a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981348; x=1795586148; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpSIJOUQjOP0Sdyl3LIT9vfFufPLepKEgm5OjTXs6D4=;
        b=XmUZ4dk0LK4ZyyoYY0HbPEL6B6/06TZuYlzPQbnup8IMEHUnieZRUyqu5CRY7VKHkE
         /2NdVPDDLm8BxM5EV9PK2T+hl0ngRg5xIZ0rcWYiiKJEuHU+dOORou5KHqo47938v9jL
         tuuojCHI7qqjbogm5k+4H92E+rA4iQSKKAT38r2qfOVH9A65jUbV0r/4weevGk4vxqdQ
         OoEdAp0IKuADKPutHPmXvQa21CdnRjUnyX1xCBJr1GvkEQw+0D8BNDN0WoEs3UEEBO4T
         fDXKvk26RLeolfBlAqbqGcOFXaXuJ0GHUFu2PrM4sq78OBlO/YPlQCvGDEZM3jlGgP7w
         BKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981348; x=1795586148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpSIJOUQjOP0Sdyl3LIT9vfFufPLepKEgm5OjTXs6D4=;
        b=BK94oh7Cw+ZKn1lm476yvpRj4H6EF42jiGUeh+eCxr5KnQCbVd38kg3qnTerUPwal4
         HzjdeNMVx5kGKdOvNQdAwZeccbP7XetizMogPW89AFCgGlfQ0LLN/EXBsuau6AJPQK5p
         TjibrJyArSc8vn3ZqKDw8C/n55VZ5f+/MPYb6Ey2Uw6XeBHNvUAj3Wu8c+z0icd9pjO7
         2vj1erUIDrNgJ/CX/R59nDYIpCxia/9C3HvgtKVoGC6ruuuacVuUe7+8T7+ENdGqhUCh
         36XfyhSIoPOVZLpChrh4Cnz92YqjoVT9wphpquQeE0wmDaj1dzfPYEqPx4b7h7WrTgHv
         y7nA==
X-Forwarded-Encrypted: i=1; AL+hErFVP0Js6WO83qqFsB3HqjiDOERHulM+/PNX8FY4YAf3b2wNX/dDGxoV+2/wXtF9EtrYgs87QO18CqgNzj1dAuww@lists.infradead.org
X-Gm-Message-State: APuU4Z9g2qkelhin7bhKsfvx3GPAmgcD6jEJ6jOjjrOY9dfQXTwkjRRY
	jpyUL75YaAb/DdmkmnFSNuntytQBD62hodALR7SdVhNRgRrjMgjTU7G/XOTefU+A3D8=
X-Gm-Gg: AYBFou0D0jxBZ+kJXTfeVwDvOkOwwwLqySDgYepg5120DS0kD0qWpHr/qfLttC0aMoe
	S3EWXWRrEMXVfLAY/oZxeFtXmr4H3uLW5EOujDcPsYAtZorbJDfgBYzPtuiSy6Vj0F1HX65x1xz
	eOwib2A2xvQDArpLFmjE5I/KaFXKhEjAokbh42rtQ34ukaicHIgnAz/P4p9Ck4l5wPAeTgo3HHU
	fChfeB9rq3Np1gQgLjoZsQSAr1CG3VpT8ilVmI1H/VgMB6gKnLIahuOoBMjBvsgquJZ15kEWjeW
	bySKV+s1139unQ1U7ivOUK8ICJSFXHDvCpFX7ZDXoAaK7dxe9ouoPiiDtLIa94HHb0MLQhMbBne
	Hoj3XSFYrcCoprxHBZgY1z+07C23ssdjB1zUpWuYTk43zOXJ3/UeM338RhofJc+cNFOz7qz1nXO
	HuGF/sIQoQcU5K+xE8wdis0stnqA1o2AOKGwRcrQTjc+9/d1G85KNZu1AJQMW/vZKsF30YqzGHk
	xZ9ANtWH2W2X4DTxE5g3TR432UCR2tLA6VgdYkGY0wRVoNL+NHW5AxBKyAjR/dlN1049OkVgOtW
	UdMtBchRegZfH8ggUcB4hp1DaU4sS2BdPsCbDj3D3zUJ4PrXhtg+jaocjSE5dj3Em6uKvhVpSJd
	EXaYGMwD6wQ1IlGwJraLW
X-Received: by 2002:a05:6a20:8c24:b0:3e2:3392:540e with SMTP id adf61e73a8af0-3fe83bf23fcmr1761880637.0.1794981347492;
        Tue, 17 Nov 2026 21:55:47 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:55:47 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Wed, 18 Nov 2026 13:55:14 +0800
Subject: [PATCH v7 1/9] dt-bindings: phy: Add PHY_DIRECTION_TX/RX
 definitions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-dcphy-rx-v1-v7-1-8de1adac3a74@gmail.com>
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
In-Reply-To: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=1462;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=7sQblceXUwwCxWuG4J0+9R8T6ZbfrV3Py9uIEDjHBZ4=;
 b=IISL7MaqFphE9FGykkbqCzIkGXZYfy271E+jKBfZ7rU0dt4KAzfvgE/OuNoSaciPzWsAGmK4E
 OSqwrJ3fqQGAyD5ybTFE/M9BPzMkGPkV3z/56WMpIf/GGjEDLoB2TfW
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_215548_843778_F3A31540 
X-CRM114-Status: GOOD (  12.45  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A MIPI D-PHY or C-PHY can be a transmitter or a receiver. Some PHY
blocks have one of each and can use them at the same time, so one PHY
node offers two PHYs. The existing cell, PHY_TYPE_DPHY or
PHY_TYPE_CPHY, selects the mode of the whole block, not one of the two
PHYs.

Add PHY_DIRECTION_TX and PHY_DIRECTION_RX for a cell that selects the
transmitter or the receiver. The first user is the Rockchip RK3588 MIPI
DC-PHY, where the transmitter serves a DSI host and the receiver a CSI-2
host.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com
Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 include/dt-bindings/phy/phy.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..9ead74d9a172 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -29,4 +29,7 @@
 #define PHY_POL_INVERT		1
 #define PHY_POL_AUTO		2
 
+#define PHY_DIRECTION_TX	0
+#define PHY_DIRECTION_RX	1
+
 #endif /* _DT_BINDINGS_PHY */

-- 
2.43.0


