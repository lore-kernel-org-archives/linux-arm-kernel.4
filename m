Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6134606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 11:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BaQv0aR1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQK7+wsr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LZ8hFklFj23uso66AQMaU2wGtHVr+hqP0S/37cpp9so=; b=BaQv0aR1Fvs90JCHBoW7vXQEL9
	krLbUokcWaHkThD1uQnRoQL4uYtLmMlB57/SDr+poW/B414IsIg7+GdgRQhyW4xOzjDjInGx9gL1r
	gWGMUwpx09dZ0Bb44cuiKxFwj7XLBd+NxKIw50ka01h8rntsIQsDPvm4O9KD0UJD9MD7BvZ3IBlhz
	v2rOiLzG9lLdOlUDaNtLTEPIAuwDlWcbE/fXQB+k29HBKnOuMsVwEsGqhAAzmPIPP+xezT9CSpJAL
	Xmi0k9beYJjPC7DUY4ivAU5ImI5X/2hkQ0rGyHovAIslbmeIgCddXo0rZS+5/GB5200HANfB0WYX+
	rUcg/dsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXGxK-00000000j6J-0ARX;
	Sat, 28 Nov 2026 11:51:02 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXGxF-00000000j5Q-1OHk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 11:51:00 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-491971ac844so7821334f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Nov 2026 03:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866655; x=1796471455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZ8hFklFj23uso66AQMaU2wGtHVr+hqP0S/37cpp9so=;
        b=DQK7+wsrURcdxGuzgS/t0glsXEEAGgn70TVV4x82YLgdY4FAFgzafb11G5yRT54gRc
         b7EG1PAJxQ8X4PXzRbb90kpD3MvhYvUoO6lHTBzLKDunBF0pT2VGLaojpRgPnK7OmRuU
         Shv5ZpyxSFhB1C06YnlOfo6Szy9ewDodZwcbiAhFgHnO9p1o67aBLGNKn3KVV6cEh92L
         hCjSR/UNIETiZPC2WpS5J2APoid42iglIaB+E14UE1xtOpL4S+zCqymv6cylyhCCikqm
         9vHGVsIzAjQ4hgiuY9+yqMX6dmUaNiBRzwnbohmQOAJets/CmJkD3aIhiLIXurUzgFAi
         W6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866655; x=1796471455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZ8hFklFj23uso66AQMaU2wGtHVr+hqP0S/37cpp9so=;
        b=owuhY+0SfivA8tnomr732tzgnwuqo9g56n4VFeYARFCfBj0TLIIzsvYQrg/NPNTmGo
         od+Qpe3QIFB9oBWGjr91CCDV1p+LXoaKe20Yelq9IbFMSG4qhy0GkUA0twclSaZyOIr0
         EpWBMtGDaE2wYOmH4zCQn/1+8WivI4SaTYUrXSHAuDk+oHK8AluEoC422LwBnLi1cOm8
         GO1JelDt5EJnLnpyg7hahNYJNbeIkweBxAcu5WysY8MJRwhKfNEKuwWm7e4qcu0fnCLe
         9pyzAQUlO2ka/6gwlWGdSIIY+dK5sDOajBjE3XsrS292qO/dduafD5q6884MfQSRGZ/r
         gZJg==
X-Forwarded-Encrypted: i=1; AL+hErFp5R7v0MQOvMtrXz0J10Q0u0LxT7JI+rlyAMRBS2z+PDKndBC01qAxDPOh8vCHdlPdTO8gjDLdIIfV3bAk19jB@lists.infradead.org
X-Gm-Message-State: APuU4Z8PsSYsqegF4oIrE1/Y5/vE0TZHnkwqEPEB64FSwuntwjz7V39Z
	tQUmuGyzt706K8CK30StjjpJpyZ1zYuIEh0pkkik+aLi9M9IOBu3mEZ4
X-Gm-Gg: AZFdTZdSj4z2tKp2Sflmj5YjrCXCNfZ+hg6xl9yyI3tdanzqLmapHJEo2BP46nROgmY
	t09oibqE9glwmhdSDHPWoCIHPP4vh57Ch38scBRhxJYl7yJfeKfs+l+fqNKwAXKnbiBIp4fV2zt
	KKYaiqR9lKxvv7XK6afW7Yv1QLgO0Wa5pYauBfn8tWkmiPWsLiCgxPInO8LxD27DaT6RShFoPA1
	fLqwQ2dSyHiWzMh1d2yrPrehvyE5y8CmeTmslSDM5eDoMeCLWpdMOBdcKUBqO4EeBrTHE1uyUj+
	RVIrTQVhwKkC9odYmlJWF5GNYj0qc7FKHb8oft5WzpX+lLzmet2e4hM36NCPGxpA0qn5p3gnGd0
	jSGZ+CmUb1MHGCp2B3MEigFG203X3yZRk08FKr7/mpRmtem33ggj7Hc4gc5Mv+GIJD0fgkUJcsg
	YTiBHMaAq9aWsGbsUO7xNaHo8JKChFF1OpeDC3CNR41VX7rCE65Wk4dNA6Ke+rJWyDpUf6AFbV+
	4srdTGjEZU5WmqbxO251isKM1Pjd2jF+S6p8pfb2PuFbCt5ecT5Yy/RIsTndK49bHJSq0iP4dG4
	8sD6tQyaNpulo2Chvd00VqVtV8sMp42EOaPuVLk=
X-Received: by 2002:a05:6000:470c:b0:4a7:557:fc0 with SMTP id ffacd0b85a97d-4abb225fb4bmr52266863f8f.32.1795866654635;
        Sat, 28 Nov 2026 03:50:54 -0800 (PST)
Received: from DebianTestingKDE-VM ([213.16.57.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm51953284f8f.37.2026.11.28.03.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:50:54 -0800 (PST)
From: Valentin Berezhnoy <dreyksmail@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Valentin Berezhnoy <dreyksmail@gmail.com>
Subject: [PATCH mt76] wifi: mt76: reorder RX frames when WED does not handle RX
Date: Sat, 28 Nov 2026 13:50:48 +0200
Message-ID: <20261128115048.84165-1-dreyksmail@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_035059_504094_D69534E0 
X-CRM114-Status: GOOD (  10.09  )
X-Spam-Score: 1.2 (+)
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

mt76_rx_poll_complete() skips mt76_rx_aggr_reorder() whenever
mtk_wed_device_active() is true. MT7622 WED v1 offloads TX only:
mtk_wed_get_rx_capa() is false, the RX rings stay with the host and
mt7915 does not set up WED RX offload. So on MT7622 + MT7915 with
mt7915e wed_enable=1, nothing reorders the frames of an RX Block Ack
session.

Out-of-order frames then reach mt76_check_ccmp_pn() first, and those
with a lower packet number are marked as replays. Since commit
1c5ed3eb68a9 ("wifi: mt76: free a replayed 802.3 frame with all
its subframes") drops such 802.3 frames, 5 GHz uploads from a client
fell from 814-840 Mbit/s to 378-593 Mbit/s, with 5031-7630 TCP
retransmissions per run instead of 583-822. Debug counters marked
2171 single and 5661 A-MSDU 802.3 frames out of 228603.

Check mtk_wed_get_rx_capa() as well before bypassing the reordering.
The bypass stays where WED handles RX (MT7986 WED v2 with WO,
MT7988/MT7996 WED v3 with HWRRO), and the NPU path is unchanged. With
this change, at most 16 single and no A-MSDU frames out of 757567
were marked, as with WED detached, and uploads reached 826-859 Mbit/s
with 66-157 retransmissions per run.

Fixes: 4f831d18d12d ("wifi: mt76: mt7915: enable WED RX support")
Assisted-by: LLM
Signed-off-by: Valentin Berezhnoy <dreyksmail@gmail.com>
---
Measured on an MT7622 + MT7915 router with OpenWrt 25.12.

This patch was prepared with the help of an AI assistant and reviewed
by the submitter.

 drivers/net/wireless/mediatek/mt76/mac80211.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 33f2bd5..4e56de3 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1751,7 +1751,8 @@ void mt76_rx_poll_complete(struct mt76_dev *dev, enum mt76_rxq_id q,
 
 	while ((skb = __skb_dequeue(&dev->rx_skb[q])) != NULL) {
 		mt76_check_sta(dev, skb);
-		if (mtk_wed_device_active(&dev->mmio.wed) ||
+		if ((mtk_wed_device_active(&dev->mmio.wed) &&
+		     mtk_wed_get_rx_capa(&dev->mmio.wed)) ||
 		    mt76_npu_device_active(dev))
 			__skb_queue_tail(&frames, skb);
 		else
-- 
2.53.0


