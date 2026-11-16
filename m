Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC77606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nl2zyHCE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=N9EiD1sS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMhu0XUz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Cc:To:Subject:
	Date:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rG+GBh1fpgsQkz9UV4Ps5a8YglcFFYNsAq1Nml020MQ=; b=nl2zyHCE6jLUmp+q9GiIv+wkm6
	HSa3rdAK35tQQF91osFHmd6CrlLUVYbVs8ptUDLoNPSlbNdE47zkv1UQnO/XgK9IUh17gk+ovVlrq
	C85wn909V43AkDEinnkcYo7Zkdr2Ox0JaWQ/LCIenAkEKgTsGHj0kujmOiIR1obDjJZs1wHhbL60F
	dXxO/5IIbjtoDwI+Hj21G1gDi/Um29KcYW09a/bRGjqfjzwkrFxQZJRPG5ZcBqdlmuoaU+ldaiWhG
	a/jW554SV1Ju2GtDCxT6lkfJQYfRVpz2rrwcRZKvZeoTQUoD7obb5KSbcmQJj7IkI9R3LEuObdhp0
	IDBiXTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwRi-00000002Y6Y-3lkF;
	Mon, 16 Nov 2026 13:08:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwRh-00000002Y6R-3CIa
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Nov 2026 13:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Cc:To:Subject:Date:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=rG+GBh1fpgsQkz9UV4Ps5a8YglcFFYNsAq1Nml020MQ=; b=N9EiD1sSojxaWQwRBKE1Z94xSY
	XMteFEqbUKjuAfkpqWi0qFUj4fpR/Pt2hL42FPOHVCdKc6jsMCY0CvvVt5j9DVkRFsoev34uaRLtc
	Zr/qUngmQF2Cdb8C1/0OlynUlZEKqXvgR9S7P8w8CmPcpaGAsT/tkrLgAj0YDBqPTAljw3r480rU3
	Dh/nmpO5RfYDKsk+zSV02rd1ynV6IrU/zqr1jYiWZ6/3LsWUZPZmZwp13c51HgK0Oq5mUsYIgM45h
	ek2fF/1xmjMPvmWoCEZ3pDCrHj7D1i8vjyXOyAF3Z0g654StP2jvUu33DTW/f5o5V/CNyYt2qtx47
	RxfhA9Tg==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwRa-0000000Dpup-1fSN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:08:27 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2efc5a60bd6so2733145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 05:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794834499; x=1795439299; darn=lists.infradead.org;
        h=message-id:cc:to:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rG+GBh1fpgsQkz9UV4Ps5a8YglcFFYNsAq1Nml020MQ=;
        b=cMhu0XUzgzxSi/5CG0XwaWe1vgOXKsPYbzkvLRZCYWBs3cdvlxmnhRJ95IdyDhJyPt
         RJLdRHL8v+/BPpBdT25yB3UkvczpNxUT3RhUdlpi867usVqxHxyxlDaI4MNI8rBsJ8xX
         hp+BLry4x91Gj/wKFyeAWCLYE2OyRZR6spCZ9ySscpmntapG9U8lWveRD6iIzssHxsMy
         B/Wz4ANUgi3igUOd80SoMOGka5ZuC4SthepOMDsKnVCuUF2CkShMTzxKoxkY+ht5aPCW
         8jPA4Mr9NYal8HWDK/Gi2DPyzVNrFYr4/kjB5Q4yWppcoqX7vYkjvUkH193GYndowCZG
         FUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834499; x=1795439299;
        h=message-id:cc:to:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rG+GBh1fpgsQkz9UV4Ps5a8YglcFFYNsAq1Nml020MQ=;
        b=ls3EUfdmGd2fK7Qs39/KaIdbm3y4y6uwCqbyaiZuVKKwLuM04eVzqiQ1ViNGQIarfk
         Nj/sTBZyXlSElT7tWyFOjcA+0az1OjeSc/eH7CFEX0Wf0kQJZevtp0IG9+Yi8AO2FZae
         dBnW0A4XsdfNcM3nHZkMoyKlxHZr6ZCujjCwsC0T9EtvKCrO68+EP2NeDKHATI4mYHKv
         90n9F6AdjMnSdYcRKSYkEpJpe0gI/EJ4S+DUgJF8HDa2Nw9qg1zSYnZNnF8PnKly7ROh
         djp8UrsAVuWu86hgS7wvp6LpJBJH5SvqwVj/zjWSAAAde8WHCG1iJoCTCP69aVzGNYDl
         nCxA==
X-Forwarded-Encrypted: i=1; AL+hErF+0Q9FOSW3I1NvCeUjaUL5vTUayV2N3HGSL80RAW2hdO1yM51XPH4BhMYEd1lAT0OQjTzY27pUrtgkFCvZrsf7@lists.infradead.org
X-Gm-Message-State: APuU4Z8cUSrwpcEl93utqxpkFRyMXkEzxpKVbO53pWPlNOKEusFN8bBv
	lPPj+euN/6XWBBzy40YcTk1u+ofhsZpLGKdLhHHupFmpGxyBD991hra7
X-Gm-Gg: AYBFou2m6cOeIF4OiGOsLOuCvm8l0z/GwLUcxTiRlJofNUKOFhRMRhCGM5mqeibYJd5
	W87nZGuGuz/JlhZd3zZ0ajzfksbXXx2yc2mKTR78HybgtVa3rStQ7N4HgBQJxkF0o9rDtrlOCGG
	cB5brsmAGVjvu0p+sUsf5ZtwFf/jTu/V/9eGybtt4gOMfa13Xg/O1goIuDJWtUSp2q/wJK/ZAZH
	aq4rqqBZedqaGVuvBDVxVe7QKC2KFqml/tz045LGnIQxrqxIs0Ao8ewAgyC+WGdZ1cmPS9CSX39
	cebqzDCET+AigFjKc4k/mu47R2M0lo52HdTSecUd2dz6PYgcRUGpwuAmBC3Bbbzus1b5G6RO5s8
	0CKqz0d1t7SQaBkZ7KLeySHvKZH3Jff5pFVJvWvtjO3uJfJm++7C1Zk/vj4whTnf6QA3CMZVhL9
	cUfAxTEdxW9ob/WqugECOya+cQFZEOodI+Y0GK//psrnkG8shzBJwHrX84irfatUEDWj8fLM3BT
	VbnlLf6e3XiU7dix7LaqPKRpE03ivWqia/TqnxSgIo2nVXTt/nZoK73aWF9tRQVWsp1U3bPxPDF
	QhsGh+MSogH2WmWHpA==
X-Received: by 2002:a17:902:cec1:b0:2e9:787c:8e68 with SMTP id d9443c01a7336-2ee0d36b42cmr109539545ad.0.1794834498913;
        Mon, 16 Nov 2026 05:08:18 -0800 (PST)
Received: from v2_send.eml ([2a09:bac5:4306:dc::16:229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad50dsm38280985ad.7.2026.11.16.05.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:08:18 -0800 (PST)
From: Haoran Wang <haoranwangsec@gmail.com>
X-Google-Original-From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Date: Mon, 16 Nov 2026 21:08:02 +0800
Subject: [PATCH net-next v2] net: sparx5: check DT port reg against chip port count
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
Message-ID: <20261116210802.2718-1-haoranwangsec@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_130822_358746_8FDA57D2 
X-CRM114-Status: GOOD (  14.89  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

mchp_sparx5_probe() reads the DT ethernet-port 'reg' property into
portno, which sparx5_create_port() later uses to index the fixed-size
sparx5->ports[] array:

    sparx5->ports[config->portno] = spx5_port;

The value is never validated, so an out-of-range 'reg' (runtime overlay,
corrupted or attacker-controlled DTB, kexec-supplied or bootloader
fixed-up DT) turns probe into an out-of-bounds write.

Skip port nodes with an out-of-range 'reg', as lan966x does in
lan966x_probe_port(). The bound is the per-chip port count from the
match data (sparx5->data->consts->n_ports), so lan969x, which shares
this probe path and has only 30 ports, is bounded correctly as well.

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
v1 -> v2:

- Check against sparx5->data->consts->n_ports instead of SPX5_PORTS,
  so that lan969x (30 ports), which goes through the same probe, is
  bounded correctly as well (Daniel Machon).
- Document how the issue was found, the runtime verification and the
  test setup, as requested by the patch bot.

 drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 08a398a..1647067 100644
--- a/a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
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

