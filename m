Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3B5606A339
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k75IGGQh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1zRix9h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EICA2+Ii2qgfcuNngaTE7AGwJ5yMZFSeIndPaowbVuc=; b=k75IGGQh+gEnQvpVVae0cWmiov
	iwE5UTDVlZcW99ThosjRLZDX65Y6uggChyOginUOT7Xx0SGRLZGATDHlxruvaKQ7JE/WbS6eEv9O2
	EbomUIQknjX+OlCeiPvNTCzIPIlFJ6Pl8MuuRU6rAcoeS4I5xXWj6tOSUFRczFo2nie4g8Go/7s6q
	5pjdny2j5QypnGrPlT9o4jjEIzkP7Jojhvp99o3+1rV5LPG9//CWxKz8YsMHjL2msi+pIEYNi+6vx
	FsuxAe46Bufil5+mvNCYhDxNr2MNgagCOYMpUCJWer6zAmOZgm2pb0cOwWgUg2tKyFIa9PgiAzWz3
	qzAR1z9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWCM-0000000HIJf-3naO;
	Sun, 15 Nov 2026 09:06:54 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWCK-0000000HIIc-0tOG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:06:53 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-833e671ee9fso3628487a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 01:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733610; x=1795338410; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EICA2+Ii2qgfcuNngaTE7AGwJ5yMZFSeIndPaowbVuc=;
        b=h1zRix9hEbCO5zfzm1XjjrtgSiQ2OrVqLhnEhvFcQqjyVnSIeLGXPAv4Z2WtDG8eu6
         oTq13bBSwtZ+4Cn7M1go97cB7vK8NGwSnPty/YrICvO6pO1HZC8dzpHJ4dpSHJx8y5rt
         uNb+bXHrZz5+oJpUngeVo5pVZSDNboVam4a2dLBjjo1SHVD1ryTBmiUoXNXvQdnp+j5z
         PSHWhwoOyBRkYfCKe1o/4w/KprXbfDCn0bkcsnrN711ZJnbRLVBtFSveC1TH/NZx3dA2
         zPr+6QKz1xufylCyVyY1u0o/aE6ypSFZoKDtYaIJTOVG3sdZydP5jfk1wXUX+r0voOKS
         2kmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733610; x=1795338410;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EICA2+Ii2qgfcuNngaTE7AGwJ5yMZFSeIndPaowbVuc=;
        b=Kk/qqG8od69nam+k3KK+g6JM56tQDosc+vV0EHgZXhdjy9+gzs8x89IoYaD8KSb6yc
         dKRsdT9zgsg9viE9TEOzMLo3Zp5acdn835Zad9kRSqP8sgJMAr+t/HbiAAj7mPoER6tD
         xAI+srO7Z/zuanuqUlP38VsNOknY6WM/p+e2h7nNg5rZHaCkgEw34XkM32Uy+GHieoUk
         K6NHcVrUdfcNuEV3iMFkuB0KezhkookwBnohkqoww6pxsUNONbZdubqe0D2iI3TL4ED5
         PB6zeLkrRTMtBhWwMwytxOxMmHZg3VRqvk7oqrCo0SlnMpFru+B6XuZ3fILbTkd8PC97
         ulAw==
X-Forwarded-Encrypted: i=1; AL+hErHa0Zek4lW+Uvh69fzNXZNZJ6nJf/rkIquxuLOHbEpcOkz2bLcSJiJTerP5Dp22p+AHT6JsPI2M8I4Yj98Ab/Ul@lists.infradead.org
X-Gm-Message-State: APuU4Z+uwgmaso0ZPezMG45rj3LDIbm+H14gJq1PQ4bybRHKHKShXnbs
	cQ2o/OMIP8ga0XadZDjZwg4nB15LaokV9NO4Fo/xQyTe3BOTKecXy1GyrPKhRw==
X-Gm-Gg: AYBFou2/BEP94AaTu2GGqrJRg/fdOa8ojCWVj91mH39bXtPMqv6esB65fQ0XTHf1jZC
	dUuYPNWoTlKX0bZEDW1+2HidkshbbwroCqWOgk8ZBs7DAHlIWHRZoigdZRWPdF0WNfsOqO57hUy
	XMeScX6rqxmYX1olG2ygTTU3JN43+SRsPuc2j1SX5LwuBidGkRs59ehZoXwX79tsTNS4LwglA8T
	1SPghZ+/TqR6x2WsM7CE5FolJh6i6m1Tr4MJZhfXD1QU52qfmA6NfBZ9KVe0JEb4iV9OY3UrxGK
	vpDrbwb+zNLgjFk/idvY9Jzi4DollJkaEqyaDHXrCU0OmAzeROqtxrBHeeQ+gph/HJN5Zuy01fV
	lQuluv1exeIXV4vjsCuh/EhXbWH6L+UM/TYM07xw9C266gXStTH7KWzDHFwH/PIAbkVO0v+rLFk
	c7QGbtloKMA9kFzxJRjgl4PRrkVEGf31H+PjODMUU0ZFeMawSf+RW4S32ehQYq5Q+c3jvSkCj9s
	NEzKuhr8SYCMRl5Y7MyDHS4GwOCdjZ0aACfkgN56xKgYl6hjv1sPW9Qh/jKOCVLwV31/cgMx00n
	Ti8jNDbnc5xh8DxZV92OU40fgB4dFQ3AP57kRqChJguAt8HM07S8Bb4CCM92t2DkP3MHuz4jlfU
	rYXke/+vURf+8FitLBC+VVMgTEZuWX3DcVNbtv3j01qsXmu/uV1Zv6LIKeLM1wQ8nfFOmus5MiA
	IxfryKi195r2hZCeMJvG8hwwzKHIFZHBjp0G8cb+0MgTubXyVniPiT
X-Received: by 2002:a05:6820:2d8a:b0:71a:e62f:62ee with SMTP id 006d021491bc7-71ae62f6ac9mr968000eaf.23.1794733610517;
        Sun, 15 Nov 2026 01:06:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4338765sm6198902eaf.14.2026.11.15.01.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:06:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/3] dmaengine: sun4i: retain cyclic descriptors until
 callbacks drain
Date: Sun, 15 Nov 2026 02:06:33 -0700
Message-Id: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr0K6dkxboEZX3sOwaMsURimYthIN4
 e4WPIHJJD8v+Xl/FhYxEEZ2KRYWcKZI05hBHgpmez12CNRmZpJLJQQvIb6Mp5RjrAhar8HqYTD
 aPmAgh4k8wizAKHGWXHFzUo5l1zOgo/e+c2t+nEV3tGmTb42eYprCZ39kFlvv3818Aipba67qU
 vDKXTuvaTjaybNmXdcv6o9WGuwAAAA=
X-Change-ID: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_010652_289197_A4DBFEAB 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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

Retain descriptors through callback synchronization using a shared virt-dma
termination helper, then use it to fix sun4i cyclic callback lifetime
and IRQ serialization. The helper keeps termination usable in atomic
context while callbacks finish in process-context synchronization.

Also serialize pending IRQ handling with physical-channel reuse so an
old transfer's interrupt state cannot complete its replacement or disable
the replacement's interrupts.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v2:
- Add a shared virt-dma descriptor-retirement helper before the sun4i
  fix, following Frank's review.
- Retain all collected descriptors until synchronization, avoiding
  provider-specific cyclic checks and preserving repeated termination.
- Retire pending IRQ state before physical-channel reuse and acknowledge
  events under the owning virtual channel's lock in a separate fix.
- Link to v1: https://patch.msgid.link/20261103-submit-sun4i-dma-callback-lifetime-v1-v1-1-4c5a0653104f@gmail.com

---
James Hilliard (3):
      dmaengine: virt-dma: share deferred descriptor retirement
      dmaengine: sun4i: retain cyclic descriptors until callbacks drain
      dmaengine: sun4i: retire interrupt state before channel reuse

 drivers/dma/sun4i-dma.c | 68 +++++++++++++++++++++++++++++--------------------
 drivers/dma/virt-dma.h  | 20 ++++++++++++++-
 2 files changed, 59 insertions(+), 29 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


