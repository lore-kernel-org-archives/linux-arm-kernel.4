Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F84060A2609
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gv+plOJB;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pKvRM1uo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oXvxlksaJblGC0L39L7NSIn5/6y+4uN6j+x6V/9C4m4=; b=Gv+plOJBTrV/ESvYOXOUwBi9dl
	bh5XXanPOzGc3mP6h/wZOC0MSVOl7G7HggSenZRCcusCE2YGFV9JchgAH0NO7FFs1tpdqIt+Gq5G8
	tEMA4m6TrNvBxZ2RXuXxLMknRtpuV/2RbmiYghmSjuJec1qhT/HNXSY+pBYWWkT2u4JBJeYGVyXHU
	3iS8dWsR0/4T3ZOMILgbjzoZleaaaufbo8y+C17l0NANj7KXYFD245OqbjD+ROMTpaSttEQKy3miQ
	oWFShRRz2IGRP1zdaEbapsSnmm5LKWqCMc0+o5nO462l9V6y+MeiQZrqK5t/6ySbQ0uitePUTyp6U
	/hInlYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5K8-00000006JLV-3nu0;
	Wed, 11 Nov 2026 10:13:00 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5K3-00000006JJN-3bEX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:12:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49d05d51553so20749135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 02:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794391974; x=1794996774; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oXvxlksaJblGC0L39L7NSIn5/6y+4uN6j+x6V/9C4m4=;
        b=pKvRM1uoWIQho8B46bR8vBKpSiVUZf6sdQMCw+qds/6bJxp/UUIQnLTYGaKJ3Rl5e5
         0ZduAKT7/OnR0JifupqkMErMM5vFESgKadbMHV75UFHsB88o1e2uEKf2zOsgxuz+UTjI
         SmVLei0eFQYZyChgmfAo5j7qwA0d9PAMtbBO5Yr/x7DrJ2EOBAuqaXQ2UEdcWLRkKH2F
         w9FFRJnlAxocSrPYnQ2wKdTyYfFLIh4G137AqLZlhEhY65hz7kDKOAj273ZxGM7lYPFw
         KOI0UhHdw3agyuX+swFA0wat9AYHYCH+HGzhRcMG/q0j03HmuBbheeRiQfB9j2AXxxRP
         K9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391974; x=1794996774;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oXvxlksaJblGC0L39L7NSIn5/6y+4uN6j+x6V/9C4m4=;
        b=bhS/DInD/1HUVNzOe+wieZhXrAA+0SyBiHuzo6W6jZVpuEWRNoROKs8ni4SFz5gHSH
         cNLsqv6/gpr3O2y4yuf9vxdDHNnnKhUCw3s/cKqE3O8UZiU2aNgBsnn+B7qA+QE7Gt7Q
         t6aVDiqPgzWheFZkcycKoyU3zvd4NjpcEYBh0C3v+B9b5Pn0FGnW02EyrVdr1CQgTaSs
         ui9LEeRqGVIci3PIpD8ZGddD+uYfEMwcJfWtU3tVLsksocBKcsZ0VtQNHpasr6IIXlyA
         PYpgjPxHiWgr5/qyQ7WcDKKVKbt117ukW2vQZqW75SYMWIYgOwBGutnJmAeROCrkLHXn
         J4og==
X-Forwarded-Encrypted: i=1; AL+hErHz2xDp9XOXt8fVuq9HDbPMiRv7r43E3ajrrF383jktOI6KKSUvmGe93iYMWG2bVO+Ufug9udE8Kb4SvmPyP8Ac@lists.infradead.org
X-Gm-Message-State: APuU4Z9A5ZXifoWnyvyK7GjEvuDvKoAAxZHgcYD9Dkw5i6VQUk85Zppj
	fSbt7yRMmzbvaaxfnXVgkcrlzmZo23ByyNSQUTD9asW+Yr8wvM56akAV16FERfu1tNo=
X-Gm-Gg: AYBFou1wSD7ZI7yQH7QJrGLN7PxT7JrasNIX8IG6eMbZFn+TSqxNu0VQs+UZVPtJrVl
	hwzyr5+Der2NWS60yVvL7SpGnAWd051XZ454TUlEGqroHq7+3jyFXcYJENhpq1tHL3AQb8OUNh0
	1wPvXr0iWs5l/5PHYHFr68sE1vxcsBbGu/MWxEiMJH+Ur44/Nm2+h9fSxqpM5/lsu3wUxiRzCG9
	MCPADmSOxTOo+eDo1mh1BiV/75xPjJNbrjrOpmaQVlK04o3K11usV7TL4/mty2rSamYpcgpdL+N
	wswIu5eGPqdQ0Z+cZIf6TRyFcg8tQvzLw/L2zNwWaVpNS0r6wOvNwx0HCzZmkxN4CRSbGUjwqCf
	Tg5ZZdK74dBNSNSOhVw1Mdjj1HxCh5gLTrVubPjKqGxYFdIWT5f1LcRwoB0FIwiS0gLUwmpW1Ue
	7+or66AfJKM2cSoztjywCTt7yQqWOHJDqjW5Rq1NAZINt64Cnhiisc7nqM+TbzQrRZb9xapH74H
	r7EPcDsdQ/eYG+IBz5aiZFmhQiWVQSV8mw1hB6CdJhycVS3+31kjmQN9uuxN8erEYhrc57PM1Be
	nKRHX9kOsu2OfIGzpk4Vh0096B8=
X-Received: by 2002:a05:600d:82e8:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4ba093a902fmr32682805e9.29.1794391973923;
        Wed, 11 Nov 2026 02:12:53 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm124194375e9.10.2026.11.11.02.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:12:53 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v2 0/2] ASoC: meson: gx-formatter: change stream lock from
 mutex to spinlock
Date: Wed, 11 Nov 2026 11:12:47 +0100
Message-Id: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ8/9GoC/42NQQ6CMBBFr0K6dgwdCIor72FY0DLAKLSkLQRCu
 LuAF3D5kvffX4Unx+TFI1qFo4k9W7MDXiKh29I0BFztLDDGTMYooZmhtq4vQyAHoyfwA5vO6g/
 gPVcJIaVZVYt9PziqeT7br+LHflRv0uEIHkbLPli3nOeTPLx/fiYJEm6SlM4RUx0nT1UuHStHV
 217UWzb9gWq0QqX1wAAAA==
X-Change-ID: 20261021-gx-formatter-use-spinlock-289b3e2e46df
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1941; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=Bisk8TI8S7BLxKLf6s4XhQgEn2v4oH3ufymXr3gbBhE=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlf7Jfcf+tnuI7rVZ/Sw+13DifL+z5rsbLxPXXKjsN8m
 3hF1MPFHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZjIjOuMDAe2+cgvmDBnRmvT
 rHvsrx2kbBy+zivWWerNzPPj1DSmZWGMDJear/7xEu2Qf2aa91j7s4Ud6xxpnwshdwsnyyku9ft
 9lhEA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_021255_911223_FAE1DA6C 
X-CRM114-Status: GOOD (  10.44  )
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

Patch 1 fixes a pre-existing bugs, present since v7.3, reported by
Sashiko [1] while reviewing the series adding I2S input support for
Amlogic GX SoCs [2].
[2] depends on patch 1 to address Sashiko's comment.

Patch 2 adds a hardening check suggested by Martin while reviewing v1.

[1] https://lore.kernel.org/all/sashiko-outbox-176054@kernel.org/
[2] https://lore.kernel.org/all/20261018-audin-v5-0-4b8cc13a1b22@baylibre.com/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Changes in v2:
- Moved 'gx_formatter_disable()' under the spinlock guard in
  'gx_formatter_detach'. [Martin]
- Added a new commit to introduce the 'lockdep_assert_held' check before
  calling formatter's prepare/enable/disable callbacks. [Martin]
- Link to v1: https://patch.msgid.link/20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com

To: Jerome Brunet <jbrunet@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Valerio Setti (2):
      ASoC: meson: gx-formatter: change stream lock from mutex to spinlock
      ASoC: meson: gx-formatter: add lockdep_assert_held check

 sound/soc/meson/gx-formatter.c | 26 +++++++++++++++-----------
 sound/soc/meson/gx-formatter.h |  4 ++++
 sound/soc/meson/gx-interface.h |  3 ++-
 3 files changed, 21 insertions(+), 12 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261021-gx-formatter-use-spinlock-289b3e2e46df

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>


