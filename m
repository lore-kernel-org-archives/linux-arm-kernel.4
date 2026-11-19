Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CEC60A3810
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LFn+Ra5E;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2VVkTEz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0nkkB75c4xO0BDbMTd+oRdUsHv55miDUR/T7l+kfobY=; b=LFn+Ra5E6IAdT1+E5ccwEegl8A
	2amIroGZwuuCsDwuakYLlpoDbi5qgexFx7oH8cPaLP45SclT9wzXbxSGZeESG27qgvWoduaw6eqpY
	3i8gpOClNTpPaL3otPXnL0MSUuyot5NYaMWUrEFa20+hNcTR47H9VRstuUeFn4NoGyKpiJ6WUszf2
	f/rcwpiMbFKX4UFuhvN5VHBHquJQEQgHL7Ug0dqfECu/QvahEsVGXGhkEwrW6gc6IIeNlyroqzQWV
	AOnR1N/1NRB+jX7UeUCyc1iuhdaLxXS1af8Egc1oaTKQPm6UijaF1HmaIx2DGsLtV8CzhZ8ux2Vv/
	eUg4Q80g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6LP-0000000CuE8-10dR;
	Thu, 19 Nov 2026 17:54:47 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6LM-0000000CuDB-2XYR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:54:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so27696995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110882; x=1795715682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nkkB75c4xO0BDbMTd+oRdUsHv55miDUR/T7l+kfobY=;
        b=E2VVkTEzguTVn612OKHZFUGzoyfluESfgyeXTC8jHlWUtq0WK4mAiUjFl6ijPK/R7I
         aiysGcGAkLec7NKwQNzEjju3d62ZGC/VwpmgtThd/ZZctIaNd9FAgqq/yS2Mi3giFNeZ
         72KHbfDxWABPolTKqMqwLXSNcjvqjwKciENwuaFg6rrheQ5iNX9nfVEdSQ2+kFlJBbni
         gEv39k8HqhIfguI7cz0ekFV60R2z2T8VCxFEstWEg/JzywleJMpTwZVSQBgwIPhkaDvy
         xqc+D3/x1LbiNa7IgrRIg0BsWH4GZzR/94gMfiJ3KomVK/IfMH7vg0yMoIAVzs9pJFYw
         k9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110882; x=1795715682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nkkB75c4xO0BDbMTd+oRdUsHv55miDUR/T7l+kfobY=;
        b=FiUILhpmrOdmEie79YGw1CeibRCASEN8vv4hV0MEnDx06sSLzAvkAjOuL4gfZ2+ONI
         Sk9g01T0T4y0dPUPFHL/N5gAfQpBhJWVyEzOmpaVmPBBEKHAbeUKYS8rEXtRub/MRpql
         IIwcPupDqISHZbZsVfAEBgFVUJtheWwO5J7rBJK4MAu9qGQDYaKnAi2GBulaW0Y8GTNp
         KtiR6JHKhwUHvxMUFf5fVcoh1jIDs1YPqve6Z2zi1G5cFo9xCLIYbveK43mvWeAXxZV5
         oN6DacMsifkNBUmQWX0q6HODyt3ZIycGLwgkLU/DKkbn59QlVCrEKAwPBSgttwaD3BnL
         /5ug==
X-Forwarded-Encrypted: i=1; AL+hErERmjf9IAsyGZGUeLOz6F3FgL8z6rbZNvUXX/D0xFIPZtqq9aYzjY4+ee13/EbkHoSeuQQllpfmRwcOySisUrwv@lists.infradead.org
X-Gm-Message-State: APuU4Z9giidehNp/TVXD70aCkN+HvRujjfTqFw/Jaa79OpLwNEuIV7Tj
	WcnQ+7OL/IAOG0xJS8soJ2UsyNOWbhEujsCsaClAEP51qV+Zp2/OHJPj
X-Gm-Gg: AYBFou3QABVLnD3c+ZybGc2zNc8ardNtXaKMKIj+3jsctX7KlKGKFxHbhxol9Ur7W2p
	GTnPtrRK5n3T4ARImrfgZR5OMT643WNz6Gi+43p/GCYSzLA+puj1Ie6ndwH+JlbWqQP89o6rdwj
	xQ3vBJxw/Tm+3kqT7LzTLwD63fIrorcKboxDqndvH55Hazgh5RaKwwCvP2k2niXCRlcj7x8sG7z
	6mfhsV/Ua025TyGzxqBlEaGUA5BG2leY+spjudNaXGseeL5Yf2JyVx+lTcnV/fjCTDRv2q5zeeH
	+ToMYhrQU/IW/FK/uJzkJ/+is58vukBKMj0NT2hGQg0lF6O9//ErLhhq8P9GQhDQljCsWdrGV5u
	+nBEiuruuW5BJOJOZnZqP/Fh6nYGM1VHrhQ2IK8T6hsH4aywruQnR3OccBt3Memp7Mi9OFrZ6N4
	Ech21Bf7Ew4Kg4t+R9qcmZbyetuPzW83lFarHazhclf7j0oOTwwzmTkoyiFrgSVBNr3rwADclEJ
	edvDnSOXgi99NjKvhQff1ykcoRBL8L1q3HwpF1RzaIBVmhyJb5OsxgSi52m8ZA9nP5PIH8NFfd8
	629Lc8AiJyG/No9ZBA4Qi81Irx9onEjXyDWDERApAmUSrcMpxHFm169LlK98J7YE+binbeduJYE
	F0/LW57HIqO1cP1j69yi0mZPjKq8EUAwWI6Beaqr0Sp17b7y9nJWGIUzahuRs4GqwBq6k5yivpP
	y21Qm8oWAHOJ9t0NAPkPk0O/KPYfmb88jWM98nTj7wBUcH13KL+Nwl4laE0CKDm+fZqC18Ta9AF
	eLbewB/pHH6GkJdZeeBTei1Og+RP49BRt6IIDT/XO+DP9hJpvXnmMSk
X-Received: by 2002:a05:600c:1548:b0:4bb:7347:d5df with SMTP id 5b1f17b1804b1-4bb88814405mr6842365e9.13.1795110881961;
        Thu, 19 Nov 2026 09:54:41 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:40 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] drm/sun4i: update DE33 support
Date: Thu, 19 Nov 2026 18:54:32 +0100
Message-ID: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_095444_690263_FBDB23B7 
X-CRM114-Status: GOOD (  15.15  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is second series out of three which aims at properly introducing
support for H616 Display Engine 3.3. Previous series [1] reorganized
driver so proper DE33 support can be easily implemented.

H616 DE33 support was actually introduced a while back, but it was done
without fully understanding hardware design. Issue with existing binding
is that it considers planes as resource which is hardwired to each mixer
as it was done on older Display Engine generations (DE3 and lower). That
is not the case anymore. This series introduces new driver for planes
management, which allows doing proper plane assignments.

Note that this series intentionally breaks existing H616 DE33 mixer
binding, which was released in v6.17. Old binding can't describe shared
planes, so second mixer can't be supported with it, and it never had any
user - there is no H616 Display Engine node in upstream DT, rest of H616
display pipeline is not upstream yet and no other known DT consumer
implements it. Reasons are documented in patch 4 and driver prints error
asking to update DT if old binding is detected (patch 5).

Patches 1-4 from v3 were already applied (clk patches to sunxi
clk-for-7.5, CSC and VI format patches to drm-misc-next). Plane driver
depends at runtime on commit 63a29fbb4ecd ("clk: sunxi-ng: de2: Export
register regmap for DE33") from sunxi tree, otherwise it defers probe.

Remaining patches, which introduce all the missing bits to fully support
display pipeline on H616 SoC, will be sent once this series is merged.
WIP patches, which can be used for testing purposes, can be found at [2].

Please take a look.

Best regards,
Jernej

Changes since v3:
- dropped already applied patches 1-4
- new patch 1: reject fractional source coordinates on channels
  without scaler (suggested by Chen-Yu)
- patch 3: mention in commit message that driver is hooked up only in
  last patch, update copyright year, drop unused of_graph.h include,
  use dev_err_probe() and MAX_DISP bound, collected Chen-Yu's R-b
- patch 4: collected Chen-Yu's and Rob's R-b
- patch 5: fix include order, use device_is_bound() under device lock,
  guard put_device() in error path, drop stale @map kernel-doc, rename
  planes platform device variable, mention missing scaling in commit
  message, collected Chen-Yu's R-b

Link to v3: https://lore.kernel.org/linux-sunxi/20261115061102.229680-1-jernej.skrabec@gmail.com/
Link to v2: https://lore.kernel.org/linux-sunxi/20260509190015.79086-1-jernej.skrabec@siol.net/
Link to v1: https://lore.kernel.org/linux-sunxi/20251115141347.13087-1-jernej.skrabec@gmail.com/

[1] https://lore.kernel.org/linux-sunxi/20251104180942.61538-1-jernej.skrabec@gmail.com/T/#t
[2] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/

Jernej Skrabec (5):
  drm/sun4i: Reject fractional source coordinates without scaler
  dt-bindings: display: allwinner: Add DE33 planes
  drm/sun4i: Add DE33 shared plane driver
  dt-bindings: display: allwinner: Split H616 DE33 layer reg space
  drm/sun4i: Switch DE33 to split plane bindings

 .../allwinner,sun50i-h616-de33-planes.yaml    |  46 ++++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  16 +-
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun50i_planes.c         | 209 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h         |  43 ++++
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 191 +++++++++++-----
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  11 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  24 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  24 +-
 9 files changed, 486 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h


base-commit: 8e2afcd2b57990465f132367fd8fdc2e55c1adad
-- 
2.43.0


