Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18B1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vIQdgzj7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uFkf7XNP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=J1mE2/uvxHDBhyh7b8T/IYHmltMNQ44dSYQaeZ69JlY=; b=vIQdgzj7xGiZDxDNDWvqKDWorT
	wYDLdgiz/68BKJpXkOIQpIVGgzDiZsP6p3hBTRZRPfcx788UUuvDb1tY1Uuuk1SSnad2NtqaGkHvw
	j7+Cla7WDN6ccwkAXtK6bI2IbSBzPQakOL3iI+qw2HxNC2SuiZLv3DJ6PFL7N1fEhddbxYDdbeeh9
	bbIxC/470RPn+JqUTYuSdu5gbH+69hZlAg99X0Ozyg4fKWcQGq8zwi2OjKFu6/JY2eB1oSv2dY8zn
	+g7eWfrttAAch6FZtgJ+WPqJgeK4ocLRMW5902dqqlhdxEZYYF5j18ioXuI5h5ccZg3ove8Jn1Ryl
	jqT3yoog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkUw-00000009zVO-32mL;
	Wed, 18 Nov 2026 18:35:10 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkUs-00000009zSz-48hA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:35:09 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-37198ed3727so142014eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026906; x=1795631706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J1mE2/uvxHDBhyh7b8T/IYHmltMNQ44dSYQaeZ69JlY=;
        b=uFkf7XNPlPMG0jkA3BWdUkzSASgttECqR86N6myjOxb9VMVzgIoOQ41d2rhoNPeHsu
         UldWKJLbVgdVCVyPaJqXCPhKwzly8wgEArMWjcOnejcRWR/W3/XPoaZEMaosA76qjvzi
         rbLNT0xlf1+rWh95QEUMkLnqat33YqgMxOj/TjFyqMKDMol9F4oL8taUZK8td17846s1
         12FQhpw52GoXCg3fUqwIcKDH1wfhpHFsHmpJ2om0R9JRPsW+5b3pEj29yNt9gTplTzpt
         yZIh5QAIopmxuDcfQa9njBvVe65TCMFV9+4syJxHQPYbCnI295uphumv5k3cAG/TC8f6
         LGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026906; x=1795631706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1mE2/uvxHDBhyh7b8T/IYHmltMNQ44dSYQaeZ69JlY=;
        b=G1BPuYRdRZ3iOYkv47oLfX3dLqcI36E6ouTZYuqtqxP/LnPhVcuvnkm8vtv6mvPKlQ
         P/Wm+22Zo/Tn6lXGll+5/nTG3l9Nz0sd8rLL+TdNCstMsvk0i9VkEc8vdtDsTy5aF+FN
         FOR1ZYT+eAh/IHKwZAJEind7w1yib3G9zDxuiNl0fGwNeJtJ507QaOQ5KMlGOFwvvTfs
         hfIFdvH3bAXCvPcAC5f6EF5yn2LGa467DDVgjMUPwT45mUIwXWMuIo4As1+cRFaDGssr
         stGt8fZufuG6CsWQ/bYNc+X9OMV73oqrMrkyKirlBuCyJ4c72Y6h4iQmoM6ES5irnSHY
         VBKw==
X-Forwarded-Encrypted: i=1; AL+hErEoGjgDIZxlUKF7vGZr//JU+0HMKb4FZIhUOxTR/+2AOeYu7BEZhqnRmX48s/G3KdDnXQLhfmpcnamF12nsEWi6@lists.infradead.org
X-Gm-Message-State: APuU4Z/c6sTSDQcNvMf3WrThMm2RcttDc+Pba+Fc2ygbJb8m9Mp+4H5D
	9RJmcmq918028d5/kS/S0N4h37U9nfG4wcIJ5la6dV6aQ2nHyub7LwEi
X-Gm-Gg: AZFdTZcCea7gw4YS7TiaDYVKqNhRBomrz+OkAJMGBbKEVtP3dSXTPxz5tUpCMJDTT0O
	+LG3zPKUFfddurHF2BbV3GsBxlE3HgqrQaqzJzyHNqBrNdrNwdAepFlOscLPJ7NKBHmhxdc5TkZ
	zogDU6Bqk46jGUr5O0Ote36+nFwbOaYtLG0hEoqZ+vr1v3f/u3qsjw+zkbhQA6qUOwVpKS/hPW7
	+QmwpMe36jmNmUrKLbhfev7CIW91vgQWXjrHMn+33kbGPLKoTs4ldGlP0c0ywFBs+RH+OAMvjTt
	MOnilI5h0GgN4WtVfdbqMajfYDR0q9HjL51bVO7u2FROF4jhxpqQ+AZbBAaCGDH8Eif7ZTe+KFa
	OD0uVS5FaI7nb+JOs696KZBn50h8PoEdjKfRm1Go+2wqxQjgqNmG5GZWwWG82KRD4v19s/mNIuU
	JUrvq7nhEuBu1hZrCrUZOTxHyaaApccIagqqnoRwmG/6oYHOazIaN7PImVFS5URSWHna5HDyc5e
	dm2Q7myLcn1IGQjel+nltBkKSuz3hb0MimV3GF9Z87JUc4YSC4xv1nfu11n9wWgEnudWWlJfnOb
	B/iZUg43U0z+DSByJi+safkQ7/0+BKVoxx1PNBN0axlRWkrN39wdmswHdqd6v7wXMdsYdOU132n
	oed/R
X-Received: by 2002:a05:7300:ae97:b0:382:2ae3:b1d0 with SMTP id 5a478bee46e88-383ee2228b7mr240375eec.13.1795026905715;
        Wed, 18 Nov 2026 10:35:05 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a73e0aa6sm9453348eec.19.2026.11.18.10.34.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 10:35:05 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH wireless] wifi: mt76: mt7996: restore the wcid flags on reassociation
Date: Thu, 19 Nov 2026 02:34:38 +0800
Message-ID: <20261118183438.44794-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_103507_106742_5AA9491F 
X-CRM114-Status: GOOD (  12.85  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On disassociation, mt7996_mac_sta_links_event() clears wcid.sta and
sets wcid.sta_disabled. Nothing has cleared wcid.sta_disabled on
reassociation since commit 13e2e9c6b348 ("wifi: mt76: mt7996: use
mac80211 .sta_state op") started setting it. The ASSOC event used to set
wcid.sta again only after the rate control commands, and no longer sets
it at all, so wcid_to_sta() returns NULL for a reassociated station, and
both mt7996_mcu_add_rate_ctrl() and mt7996_mcu_add_rate_ctrl_fixed()
dereference it.

Set wcid.sta and clear wcid.sta_disabled at the start of the ASSOC
event, as for a first association.

Fixes: 13e2e9c6b348 ("wifi: mt76: mt7996: use mac80211 .sta_state op")
Fixes: 28d519d0d493 ("wifi: mt76: Move RCU section in mt7996_mcu_add_rate_ctrl_fixed()")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Found by code review. Tested in a QEMU guest with KASAN and a test hook
that reassociates a station through mt7996_sta_state() on a synthetic
device whose firmware commands are captured: without this change the
second association hit a NULL pointer dereference in
mt7996_mcu_add_rate_ctrl(), with it the association completed.

No new W=1, sparse or smatch warnings.

AI assistance was used.

 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 9321c8146e2a..77f0664fe57c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1491,6 +1491,10 @@ mt7996_mac_sta_links_event(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 
 		switch (ev) {
 		case MT76_STA_EVENT_ASSOC:
+			/* Restore the station state that DISASSOC cleared */
+			msta_link->wcid.sta = 1;
+			msta_link->wcid.sta_disabled = 0;
+
 			err = mt7996_mcu_add_sta(dev, link_conf, link_sta,
 						 link, msta_link,
 						 CONN_STATE_CONNECT, true);

base-commit: 763b13f622e2758726e8e3ecaef819db8fa0430a
-- 
2.56.1


