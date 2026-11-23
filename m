Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51331606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=umBvyLIh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BrDdD+O0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IEvJeXJOsH9S2fJ+fRG2KCQNfhieUtoOB+kM1PZCkvU=; b=umBvyLIhhY1B9Y
	FmJFUBSLukDE/YP1o4gWMhNUE59byaEmz2NSZVv+Y5CnzG+ezyKVPFLINktO02lwLvufX9LiOycNJ
	yXwl6qkaZlnq30+WoCz0LtiATl5F4TDBPHedvLt8CkEA+BhmRvQOmZj1ldogyW9m6forx5ZQTXvjS
	rVhsJq7qum1RPZWL/YnVMgEJT/urOyhN4RrqHloZVwWdcicfOhmOzdWCqmisuEqaEqjs9fxtVjm7b
	Z1oK6LswtXQvDVctG88JQ/ekXEkspsqQPOEndagpb9j7+XmPuZunaQUhnPxmI1OZkxpp7/KoJJcNA
	aHgMu5FIpzQHzMTFbIJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO4O-00000002Q2p-2SVV;
	Mon, 23 Nov 2026 07:02:32 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO3b-00000002PrC-3CUu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:02:17 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c5118deebcfso420037866b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 23:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417291; x=1796022091; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IEvJeXJOsH9S2fJ+fRG2KCQNfhieUtoOB+kM1PZCkvU=;
        b=BrDdD+O0t0U4Z3a/+EpsQjL7XDDMK2b9NMzr3LeRmvF1tV6Ma78MdT46DveLx9IpPa
         UrExpEXdybPO6nGeXyWDCYV1HWXQat5L/GjXjGm6eustDeNyo/8fT4AHtjPzBi+oTiEy
         84YQ9yQUKM9rpqyl6NEqY9qv5YLlKLN4Ew8Hafm8/RZU2ta28nYdYXe3WwHGri1f4/jG
         I7YXUrGd2BeZ55T5/3EiylHezvKyDtbthSk6vXWdQV9RpJ2/G3NSgSux2WjpKgJggwf/
         cH71Lsrcak+PU+6azsY1V76T8VrADKYfZYc/mHzuHXBbn3DWOWsFxNuT5mxB3ZdO8jpb
         XATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417291; x=1796022091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IEvJeXJOsH9S2fJ+fRG2KCQNfhieUtoOB+kM1PZCkvU=;
        b=yJs7q42F+x9kc7m/BKGdrPqbzFd//y2N9eQtj71t7Ft+spGkA1GgGZtGnwmgmIf3Y5
         C4fAbFBdHzBdOCffYLd7D2arc9vnZK1AGkfzkitVWQWPsQ2PWpk86gFznbizp/VxW3LC
         8n7qApSzNSJzXoiVoF3WlXqMDe55TS6m9AKjhmtkl/T7GOdpKsBbje+yHoc5FxmqQKQC
         S4Kfk431PkBptyLBsv2wnscr2VPXVmGoMdl+pskwYIx9QFxo5EmYVp4H22PqUpYlUNvW
         NfKG614YRhmKkbANFd/cFYTbFIO92xfFalaU3jhdYzQe/IbK/ZVro51V6+RXIR3XFQIb
         daRw==
X-Forwarded-Encrypted: i=1; AL+hErEiBSEObnlXLdmCHnct//HUfBCOL6KwRxh/IsAyteKJ8D93vwfRPWc/r/0KyihIhA3X2xIiNRcu3faILEM82lSb@lists.infradead.org
X-Gm-Message-State: APuU4Z+VAlko72gchjZhQyVi4oU0W4lYgdwCT90EJu8So+HVj+9SIIPf
	kRBuCNbMyJj7BmSVKMmaiCVyqxMMfv8qS21kxoZX75Pz77qfSCiqtQ8T
X-Gm-Gg: AZFdTZdH/cGw3w3qE0MjNlsHL/02bmKZV7Ud0WRFJkbrzW3aL3ztLlhNbqADxp/u0xX
	u0/uFsMdeqN7nmRrNdB4YsRMYgFxFTi/qhkO5o3wZG5MJtMj3LmO4IJgMUOTf5se5XNwfLG4Qgk
	9L2x9vT/wa3Ajjt02xGw+rZJ/MURTfBg0VmdXpEONaLu66Ayku19XIpB4IrgUmYT1jFJTJJE742
	M0yW4X2lJVl8p4WRzCKsUy1Ibdy827D+PU909H3BfgFDVZFJePzTrYxWuaf3LkgMlBR5pOtWInl
	h1rbXIe2x+h74RLRcc2t+2HNfHW9prevLoZUG6DrP8Sr+ne62xPPPq7y9YmhDCNInAQVnD9txaV
	0seBprMOADw0fjKUnwgAsjXNmzw4VWDlqD4e/BXM3X7nn+6bVSJIJAcq5RjJoz1hpss18h7lHik
	1Mz5elyIqwnyv9LlYKBamiR0YJ4+wFY6pNM7uJeBzXrXH1MSEPv8qDo8VHG8K74P+OnVNhyja19
	4bl7wA4chzoys78YB3PpnTGSlI7i3vgJaA3mqGrEAC8HieKOEf/OAzNBa0sSYq1s2SJ1vra8D3G
	bEcCV5rptmKfnbUBDszp7dHCE7DG0qfjNOpF
X-Received: by 2002:a17:907:e00b:20b0:c4d:22e2:1a2b with SMTP id a640c23a62f3a-c513a47e2ffmr543211566b.1.1795417290844;
        Sun, 22 Nov 2026 23:01:30 -0800 (PST)
Received: from fedora ([154.182.66.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm20779007f8f.3.2026.11.22.23.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:01:30 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com,
	amin.gattout@gmail.com,
	antoniu.miclaus@analog.com,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 1/8] iio: adc: at91_adc: skip unpopulated triggers on teardown
Date: Mon, 23 Nov 2026 09:00:54 +0200
Message-ID: <20261123070101.53868-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_230200_871351_40B0E668 
X-CRM114-Status: GOOD (  11.38  )
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

The driver keeps an array of triggers and leaves the slots for external
triggers unpopulated (NULL) when the "atmel,adc-use-external-triggers"
property is not set.  Both the error rollback path in
at91_adc_trigger_init() and at91_adc_trigger_remove() walk the whole
array and call iio_trigger_unregister() and iio_trigger_free() on every
entry, including the empty ones, which dereferences NULL.

Skip unpopulated trigger slots in both loops.

Make a minimal fix to simplify backporting. Moving over to device managed
cleanup will shortly remove this code.

Fixes: 0e589d5fb317 ("ARM: AT91: IIO: Add AT91 ADC driver.")
Cc: stable@vger.kernel.org
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 0ac74ad92fca..9ecf8ca362f5 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -660,6 +660,9 @@ static int at91_adc_trigger_init(struct iio_dev *idev)
 
 error_trigger:
 	for (i--; i >= 0; i--) {
+		if (!st->trig[i])
+			continue;
+
 		iio_trigger_unregister(st->trig[i]);
 		iio_trigger_free(st->trig[i]);
 	}
@@ -673,6 +676,9 @@ static void at91_adc_trigger_remove(struct iio_dev *idev)
 	int i;
 
 	for (i = 0; i < st->caps->trigger_number; i++) {
+		if (!st->trig[i])
+			continue;
+
 		iio_trigger_unregister(st->trig[i]);
 		iio_trigger_free(st->trig[i]);
 	}
-- 
2.56.0


