Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C47606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fcRGrHK9;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=PECAIvbD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Cc:To:Subject:
	Date:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3BqdCJTGw47ZPbEBDmV2Sxr2xhOXRAA8TmzOR2G/4rE=; b=fcRGrHK967OvXoXVWtQyhRVwO1
	i6sPyks18iy0PA+AZhtVRLiMQF6VwW5uJI3K4M8mOaavQX7QaJf2QAbGKxXSwLyOSwK1po8LTpAVW
	MfQ/WRDXHzntu31s7kHOZqmCQ67I1oerVhd8WSS3b2JeBWXgXef5T4mkEFNXFPk/mFckes1NtKckA
	5s7gXTXXA2qtEZZQeCfeasCOkBjjcwJWXDz+gL6f55gzpryUGx2V+S3s5hkdW3u20UKVCyxmwR5E2
	jWsSiauM0Sg9YsR4wg7cmJTzRVuxpa14QeU+Pa5fbdhVC2cyj3MqOK8ovmOfNrBud9FFoU7Hm9i3h
	Nd22oUhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyj4-0000000BRF9-1tkz;
	Thu, 19 Nov 2026 09:46:42 +0000
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net ([46.101.248.176])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyj1-0000000BRE0-0yXX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:46:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:Date:Subject:To:Cc:
	Message-ID; bh=3BqdCJTGw47ZPbEBDmV2Sxr2xhOXRAA8TmzOR2G/4rE=; b=P
	ECAIvbDr/63E056kTp7RIxuk9w+EhN9D3nGamcaf234TdfvVY/yh1gbyt9Rrc0YB
	wzq9A6p1nf57do74aRMEdTwkCWsKm57PDh3aRkYuleEdLuauZelz6hhWMtR8CtuG
	nj3NAyNEIS5JSD8yw6+SHNKcokS7D3yiNZtH7Malps=
Received: from v3_final.eml (unknown [58.206.202.11])
	by web1 (Coremail) with SMTP id yAQGZQAXhjZ2xf5q5qN6Ag--.9276S2;
	Thu, 19 Nov 2026 17:46:30 +0800 (CST)
From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Date: Thu, 19 Nov 2026 17:46:13 +0800
Subject: [PATCH net-next v3] net: sparx5: check DT port reg against chip port count
To: Daniel Machon <daniel.machon@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 UNGLinuxDriver@microchip.com
Cc: netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Message-ID: <20261118162156.17688-1-wanghr2026@mail.zgclab.edu.cn>
X-CM-TRANSID: yAQGZQAXhjZ2xf5q5qN6Ag--.9276S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw4fXFyxuFWUXw47Gr1rJFb_yoW5Cr4xpF
	Z8Aas8KrW8Gr43Ca4xJw48uas09a1DXFy5Wr1xCwsxWw45GFW0yryxKFs0vF1jkrWrJa97
	JF4Yqa43Ca9FkFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBKb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r
	17McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48J
	M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8uw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42
	IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5qZX3UUUUU=
	=
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAQEQD2r+rmUtngAAsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_014639_555619_0B0B8A65 
X-CRM114-Status: GOOD (  13.56  )
X-Spam-Score: -2.8 (--)
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
X-Archived-By: <archiver.kernel.org>
Message-ID: <20261119094613.klyjRQ7HPrCZV7VwnhNzSf_Ev6wIWbyixM5FfrNrJS8@z>

From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>

mchp_sparx5_probe() reads the DT ethernet-port 'reg' property into
portno, which sparx5_create_port() later uses to index the fixed-size
sparx5->ports[] array:

    sparx5->ports[config->portno] = spx5_port;

The value is never validated, so an out-of-range 'reg' (runtime overlay,
corrupted or attacker-controlled DTB, kexec-supplied or bootloader
fixed-up DT) turns probe into an out-of-bounds write.

Skip port nodes with an out-of-range 'reg'.  lan966x_probe_port() has
the same bounds check but fails probe with -EINVAL; skipping here keeps
the remaining valid ports working.  The bound is the per-chip port count
from the match data (sparx5->data->consts->n_ports), so lan969x, which
shares this probe path and has only 30 ports, is bounded correctly as
well.

Found by a scripted scan of of_property_read_u32() call sites used to
index fixed-size arrays, followed by manual review. Verified at runtime
on a pristine v7.4-rc2 arm64 QEMU virt machine (inline KASAN,
CONFIG_SPARX5_SWITCH=m): an out-of-tree module supplies only a
malicious DT overlay, the unmodified in-tree driver performs the store.
reg = 15839 yields a KASAN use-after-free, reg = 0x20000000 a wild
write 4 GiB out (paging oops), and reg = 65 silent in-struct corruption
with a later NULL oops. With this patch all three are skipped. The PoC
and full logs are posted in the thread. Not tested on real hardware,
QEMU virt (cortex-a57) and compile testing only.

Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
---
v2 -> v3:
- Fix the diff paths (a/a/ -> a/, b/b/ -> b/) so the patch applies
  (Daniel Machon).
- Restore the in-body From: line so the author matches the Signed-off-by
  (checkpatch author/Signed-off-by mismatch).
- Clarify that lan966x fails probe instead of skipping (Daniel Machon).

v1 -> v2:
- Check against sparx5->data->consts->n_ports instead of SPX5_PORTS,
  so that lan969x (30 ports), which goes through the same probe, is
  bounded correctly as well (Daniel Machon).
- Document how the issue was found, the runtime verification and the
  test setup, as requested by the patch bot.

 drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 08a398adf..164706745 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -845,6 +845,11 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 			dev_err(sparx5->dev, "port reg property error\n");
 			continue;
 		}
+		if (portno >= sparx5->data->consts->n_ports) {
+			dev_err(sparx5->dev, "port %u: reg out of range\n",
+				portno);
+			continue;
+		}
 		config = &configs[idx];
 		conf = &config->conf;
 		conf->speed = SPEED_UNKNOWN;


