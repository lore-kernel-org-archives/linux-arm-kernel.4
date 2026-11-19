Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD1A606CA8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vnyNrCAS;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TUFB1DoC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7rjsvuE5Z5xtUgwxRQYW4DMUqOYVY8VlBsT0TOMfduE=; b=vnyNrCASZn347SsaBCxV88IkaT
	HLATdcz+KVpp6LWOZV6t/iWB9/Z/2pPDKTlMiArGeHNb+zcvfolu97jgvJ/Xk587jTtbwfEpjfUPx
	KQdobM7c5rdFtNKZjhqAfVGjGfw31qH7pdyYzXbU98wlnjlvRhNjOsoCoAYyAAKv98m1995iKvHKj
	BUATXdUm4q28Jx1cXAhaCu8ezz06o2x3E/VJlAnBXzT0O+Ta8gK42HpO7xnrVihvJlwEAGEACcWN4
	Cf8ys3JTJWnbteoHNY4bM9CkCUNLsbjM6O0J3neby65LMWvVXF3dI1ArdTn1jE1EeG+bmU+xROlUS
	DZb0KRTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5eF-0000000CnZl-2Zb2;
	Thu, 19 Nov 2026 17:10:11 +0000
Received: from mail-dy1-x1347.google.com ([2607:f8b0:4864:20::1347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5eD-0000000CnY0-2EkF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:10:11 +0000
Received: by mail-dy1-x1347.google.com with SMTP id 5a478bee46e88-383ec96a7deso1422447eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108207; x=1795713007; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7rjsvuE5Z5xtUgwxRQYW4DMUqOYVY8VlBsT0TOMfduE=;
        b=TUFB1DoC17seFuLIwr1HXdFjetFqWageLCH83tLZ3iiMNxmYYyAGAAJwfmWBxfEcLF
         nhuxPmHGU1Lj330pXSfgjfaOmrrVh/1YSrDfZyaHe/SKdvBbnQ1fqrbNV77Z/RRW5rut
         W8btbgsKjKCXsoFK/Px0c07K2XjxvFpv5bbUQBGORJVXHGFrYrWDcGlPRgDb8HvKEQoS
         9RPbFLJHTbLxqdiLyiui2vy9Z0T+CkCA115Gj8FeiN4O3g0kC1n6aXb0sepNwnK1dxDr
         7kw2r2A54VH5x7SM3OnDd6qADrXKm8B2r5yxycEr4Jb+tb9khkNoiYYaKfRVgkt47PEz
         gSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108207; x=1795713007;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rjsvuE5Z5xtUgwxRQYW4DMUqOYVY8VlBsT0TOMfduE=;
        b=KC3ZjoXze4zM3kMs4Rwts36p6rCTlhxQoHZ0TfoIpBYoM5H7DNlX7kI8Uv2HvRNrLG
         +pquoxiyJZ3yDQNvAGw3g9vWp6pla5BOEwj2CsUWSekTKC56R8VcLai/+fjsWH244nUP
         QuE1ZiJ+t02j9MMVHxo48eFgV9uUZqIhczWnGmes4JlnGuipDucL5pZ28ihtVL1JvPSA
         NEAwYJxQGbxDyYxWlxMG1KAQEAZn4Y5HlBzdQsdQGnWGCtIT8g4m1NOUnVo8T/pX+lzk
         0qbXL5NijnRlYWL5jO8i02wOECRQDbV2A8xMYjyrU8VLHf1A/Bw+sLC18d1mLw22xoNu
         pKQg==
X-Forwarded-Encrypted: i=1; AL+hErHwfIfVHoDpAYaexU/M/31onbvaFqt4xMM1NpiNjmKmM4uwtIIHNuVQ9yLgIe7gj+MNFUxaZ57jFqdD/Yo6yVh1@lists.infradead.org
X-Gm-Message-State: APuU4Z9ymEEfZjmCpBogDnlHxyp72nFi39YRao0brvcjZOc6p+AB3r7T
	cFvRrGe717fPrCBOw9+Nv0zZh5QX2jK1nAt78RTQpp1/WYda2qtgtxW1pM/HlcsWe1Q+1VXkWD8
	86l3e28P32g==
X-Received: from dycuc2.prod.google.com ([2002:a05:693c:3f02:b0:385:6092:b1e0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:8288:b0:384:6487:b155
 with SMTP id 5a478bee46e88-3846487bba9mr2183037eec.29.1795108207046; Thu, 19
 Nov 2026 09:10:07 -0800 (PST)
Date: Thu, 19 Nov 2026 09:09:27 -0800
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170927.1532076-1-irogers@google.com>
Subject: [PATCH] wifi: mt76: mt7925: Initialize err in mt7925_set_key()
From: Ian Rogers <irogers@google.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_091009_577723_0B204032 
X-CRM114-Status: GOOD (  12.60  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In mt7925_set_key(), when configuring a key on an MLD interface with
key->link_id == -1 and msta->valid_links == 0 (for example during link
teardown or key removal), for_each_set_bit() executes zero iterations
and mt7925_set_key() returns an uninitialized stack variable err.

Initialize err to 0, matching mt7996_set_key().

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building drivers/net/wireless/mediatek/mt76/mt7925/
with LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized; not
runtime-tested on MT7925 hardware.

Fixes: 3e758e9f777c ("wifi: mt76: mt7925: add link handling in mt7925_set_key")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 8d591f265260..e39e4674e26d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -735,7 +735,7 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct mt792x_sta *msta = sta ? (struct mt792x_sta *)sta->drv_priv :
 				  &mvif->sta;
 	struct mt792x_link_sta *mlink;
-	int err;
+	int err = 0;
 
 	/* The hardware does not support per-STA RX GTK, fallback
 	 * to software mode for these.
-- 
2.56.1.708.g77570a6a1d-goog


