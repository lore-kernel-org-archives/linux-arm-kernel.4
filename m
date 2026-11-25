Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB04606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HfOPA/GE;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=OcOH5H7y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AKIcUxt+msSiiJz1d9kZ/ecSgsFVs8DrJA/QJHIEgRo=; b=HfOPA/GEfE9Pj1
	2EuzAWwYv4kQAu0QExOyrmGTiyj5S61BWKE9DcWwJFzgIk/DS9aq/6X1twS++Jjttt7n91NHPUIHY
	m9kkOGrMri6YcOwTKoJ2p/3nMTvNdAsbMA92QjcnyrAqCLNGd4FbZNyws+8Inst5qNLwmAsunjjbT
	i4rEUOzlbed4GWLWasXWCYeH/Rqsmhy7/rimGNbnC0xL96RAuP9f+FI05LEl6RuykDWktV3Eap0J7
	8C2rg+ictWtKTAVPJjri//adAIBUw1Nj+AZiyDJyE2IXhi7JPUSC6GP/mN5AD+wmM0Y3P+lDYKR1b
	94igfHRPVgffEsDLa+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIoA-0000000BAO7-14SW;
	Wed, 25 Nov 2026 19:37:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIng-0000000B9zn-3sBP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 19:37:10 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-490d59c3edaso4231921f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 11:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795635423; x=1796240223; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKIcUxt+msSiiJz1d9kZ/ecSgsFVs8DrJA/QJHIEgRo=;
        b=OcOH5H7y8W0TqbOGqSW+yqcrOnVKinhCcBqB5K3d223HKPJ5EfnmzVUUz+Eu7ez6UH
         XgN2NuEzxtDtwLbNLqcczIXeCHCQ5citgiPP1nQ3IUmBD2ePjSJqunwye6qoW7f9dimZ
         MviCAkh1aQPAVYbxxNEtKQqAbDX5GaXgp7cZxl5pd9fJt8oYZCt5Q44dqAiBEgS3eUb6
         lsa3iZ/fLXdmSUuYx6JW7EWmSBqveLrc2tDXkCSke6nTNqSlE332GZBIP0mKhcE5QsPn
         u8LZ8IulylL2G0WkqWuEbA+M6FiUS0URELZ7yZ5tja+R2yMTU2ihoCAJ1DMHxXKMMXWQ
         SvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635423; x=1796240223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKIcUxt+msSiiJz1d9kZ/ecSgsFVs8DrJA/QJHIEgRo=;
        b=ISxLAUx0C2O16AQF8WoKywI0ISuSHgjGiGtZJ9HVPeo06SWvhRyq/XLUJgtYquxIRl
         SL6PnSZoT1e4DJZmCr6/PsYNC2yexSTJ9nQq+lO7gHycbEAF4K1kkfr3j7qZPxPhpNyc
         789aIMIk+8cs9yt979mMAQuX8dNZ2765qeCDsoUvK+LfevHP3NxBHyqnhe8SVwu6WX4t
         K6fBEXoocwmnAaisE8woSSEz2o+oJlx6hfahOWIb6+33d/z7NjhFIik2OTTAAVLcBzMg
         W8BfPsUNeSMhHXuhz/sViQdAw5Rntw1MPXHw6lavaJCWnufWTHSZZAOKfFQgybBiEqwa
         AjVQ==
X-Forwarded-Encrypted: i=1; AL+hErFkjomneI8B0bOUZk3p/t5grl3VaT+xhTBQN+Cm5u+K5ozvS2AclXQ6RrL3jpWmwkledweFKTqqhnHdy3aZIo6m@lists.infradead.org
X-Gm-Message-State: APuU4Z9Rnnw2AqEix/sFX6UOGQSwREasJbio3QG9miSOyrHYgySQnvS4
	iFZwq0DG0tE0F4m0YuqfpBp+VwkMJt/6d/gQ+/5cYb7HqW7tTchxtI5+1YV71V4hiKk=
X-Gm-Gg: AZFdTZdZSTe5/RkYecnzCk5ZJ6sssGqXieTYfCveroxkwtnXKZ82CjcVu4QEja4Y/jT
	jMQI3PVq7Ndo0VzZJA7kRRqeXS5L8TKewrv5ZEHbTASqTcSy+TWGuIzqDcI8kuseSuFA0ULTdLv
	OQLOp7qRQmmOpeZsX4tOZCBJiPBu3jKQMzcg7PxoEFV8PGEDA66xt8+jIpF70B/8y7JHYMwhT5Q
	Eqsn512+1N2eIMQx+Pb1GP9F/4SDhEvdhHzlftiNSaMPDcqN4v2O/iKHMZFpLP6H+lwElgvkYCY
	uX8hI39G0iS1B/nm0DRp/Vbj4ZWSJiIn2dXXGsbGX91qbXSv/te2O6MUX99w+rVbkHGzo50knPz
	WDXg58Chur6j4r5Okjw0U2pIDd3fBPKCQSzgoPla8FQ5JHiOZwurLw3KX51K+zDwz51LGPJ+1B6
	PK9Hkuo4R0HY6y/uJ1oahVb+KojGg+pfVuqGDB3D6Gy5ehFpsubGGCx6lPUF1v2JHNh8iPtgMwJ
	nZFOcnRyCor3E+D/Q85qWPVncul7TPLttGzMiER2fAikb7sRtMzbvTwIMcSaghjP+NF1FUlHM3A
	NMjCcjgKyh6hjixJunWn4lUwq5SApXE5sSiIrAnL2eoDLd+y3V7RZ/WbVNrZXq9j35xO81hdT4S
	pRHU93WdWcA==
X-Received: by 2002:a05:6000:4310:b0:4a9:6c58:178a with SMTP id ffacd0b85a97d-4aa55bfeb43mr44826785f8f.12.1795635422820;
        Wed, 25 Nov 2026 11:37:02 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm35614063f8f.49.2026.11.25.11.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:37:02 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 23:36:40 +0400
Subject: [PATCH v5 3/5] net: of_net: Derive MAC addresses from a unique
 device ID
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rk3576-otp-cpuid-mac-v5-3-b3125c9a5fc8@flipper.net>
References: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
In-Reply-To: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5556; i=alchark@flipper.net;
 h=from:subject:message-id; bh=+mHeuNbPVMSogKiUzepCmrFMa5pw6cOuPMEgrE/36/E=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzW5ztWZi1XclPvPDLBJ0+/qO+F6L3d00+eUdB54Cfa
 gzP75WLOyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqfh1Ghg++hzyqdq7hMnXJCz4VLL09wGPhuZsrLop3898tNlzWs53hr9zCG/d
 6909ueLwulX3HAnNRJ5mwR7E5K1lfej+e9a3ciB8A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_113707_561807_0FECF136 
X-CRM114-Status: GOOD (  26.47  )
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

Bootloaders on several platforms derive a stable MAC address from an
identifier unique to the chip, such as a SoC serial number in OTP
memory, so that boards without dedicated storage for an address still
get a persistent one. They patch the result into the device tree they
pass on, which leaves kernels started any other way, e.g. straight from
the SPL in Falcon mode, with a random address changing on every boot.

Derive the address in of_get_mac_address() instead, as the last resort
after any stored one, from a "unique-id" NVMEM cell. Doing it here
rather than in individual drivers lets any controller with a device tree
node use it, including PCIe ones. Pick the derivation by the compatible
of the referenced cell, as the algorithms differ between vendors, and
index the addresses by the device's "ethernetN" alias, which is how the
bootloaders assign them to interfaces.

Start with Rockchip, whose bootloaders hash the CPU ID as a lowercase
hex string with SHA-256 and XOR the index into the last octet. Follow
U-Boot's rockchip_setup_macaddr() exactly, so that both yield the same
addresses.

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 net/core/of_net.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 103 insertions(+), 2 deletions(-)

diff --git a/net/core/of_net.c b/net/core/of_net.c
index 93ea425b9248..1f9858d2d444 100644
--- a/net/core/of_net.c
+++ b/net/core/of_net.c
@@ -4,7 +4,9 @@
  *
  * Initially copied out of arch/powerpc/kernel/prom_parse.c
  */
+#include <crypto/sha2.h>
 #include <linux/etherdevice.h>
+#include <linux/hex.h>
 #include <linux/kernel.h>
 #include <linux/of_net.h>
 #include <linux/of_platform.h>
@@ -97,6 +99,99 @@ int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 }
 EXPORT_SYMBOL(of_get_mac_address_nvmem);
 
+#define ROCKCHIP_CPUID_LEN	16
+
+/*
+ * Rockchip bootloaders hash the CPU ID as a lowercase hex string with SHA-256
+ * and XOR the index into the last octet, see rockchip_setup_macaddr() in
+ * U-Boot's arch/arm/mach-rockchip/board.c.
+ */
+static int of_mac_from_rockchip_cpuid(const u8 *id, size_t len, int index,
+				      u8 *addr)
+{
+	char hex[ROCKCHIP_CPUID_LEN * 2];
+	u8 digest[SHA256_DIGEST_SIZE];
+
+	if (len != ROCKCHIP_CPUID_LEN || index > U8_MAX)
+		return -EINVAL;
+
+	bin2hex(hex, id, ROCKCHIP_CPUID_LEN);
+	sha256(hex, sizeof(hex), digest);
+
+	memcpy(addr, digest, ETH_ALEN);
+	addr[0] &= 0xfe;	/* clear the multicast bit */
+	addr[0] |= 0x02;	/* set the locally administered bit */
+	addr[5] ^= index;
+
+	return 0;
+}
+
+struct of_mac_unique_id {
+	const char *compatible;
+	int (*derive)(const u8 *id, size_t len, int index, u8 *addr);
+};
+
+/* Derivations by the compatible of the unique ID cell */
+static const struct of_mac_unique_id of_mac_unique_ids[] = {
+	{ "rockchip,cpuid", of_mac_from_rockchip_cpuid },
+};
+
+/*
+ * Derive a MAC address from a "unique-id" NVMEM cell the way the cell's
+ * binding defines it, indexed by the "ethernetN" alias of the device, as that
+ * is how bootloaders assign the derived addresses to interfaces.
+ */
+static int of_get_mac_address_unique_id(struct device_node *np, u8 *addr)
+{
+	const struct of_mac_unique_id *entry = NULL;
+	struct of_phandle_args cell_spec;
+	struct nvmem_cell *cell;
+	int index, alias, ret, i;
+	size_t len;
+	u8 *id;
+
+	index = of_property_match_string(np, "nvmem-cell-names", "unique-id");
+	if (index < 0)
+		return -ENOENT;
+
+	ret = of_parse_phandle_with_optional_args(np, "nvmem-cells",
+						  "#nvmem-cell-cells",
+						  index, &cell_spec);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(of_mac_unique_ids); i++) {
+		if (of_device_is_compatible(cell_spec.np,
+					    of_mac_unique_ids[i].compatible)) {
+			entry = &of_mac_unique_ids[i];
+			break;
+		}
+	}
+	of_node_put(cell_spec.np);
+	if (!entry)
+		return -EOPNOTSUPP;
+
+	alias = of_alias_get_id(np, "ethernet");
+	if (alias < 0)
+		return alias;
+
+	cell = of_nvmem_cell_get(np, "unique-id");
+	if (IS_ERR(cell))
+		return PTR_ERR(cell);
+
+	id = nvmem_cell_read(cell, &len);
+	nvmem_cell_put(cell);
+	if (IS_ERR(id))
+		return PTR_ERR(id);
+
+	ret = entry->derive(id, len, alias, addr);
+	kfree(id);
+	if (ret)
+		return ret;
+
+	return is_valid_ether_addr(addr) ? 0 : -EINVAL;
+}
+
 /**
  * of_get_mac_address()
  * @np:		Caller's Device Node
@@ -108,7 +203,9 @@ EXPORT_SYMBOL(of_get_mac_address_nvmem);
  * because that is the default address. If that isn't set, then the obsolete
  * 'address' is checked, just in case we're using an old device tree. If any
  * of the above isn't set, then try to get MAC address from nvmem cell named
- * 'mac-address'.
+ * 'mac-address'. As the last resort, derive one from an identifier unique to
+ * the device in an nvmem cell named 'unique-id', if the way to do so is known
+ * for that cell.
  *
  * Note that the 'address' property is supposed to contain a virtual address of
  * the register set, but some DTS files have redefined that property to be the
@@ -142,7 +239,11 @@ int of_get_mac_address(struct device_node *np, u8 *addr)
 	if (!ret)
 		return 0;
 
-	return of_get_mac_address_nvmem(np, addr);
+	ret = of_get_mac_address_nvmem(np, addr);
+	if (!ret || ret == -EPROBE_DEFER)
+		return ret;
+
+	return of_get_mac_address_unique_id(np, addr);
 }
 EXPORT_SYMBOL(of_get_mac_address);
 

-- 
2.56.0


