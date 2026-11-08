Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CE2606A336
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 18:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JS8OW8h2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cw1BPu/j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7LOc5o/iR4ccdtew0ZugkEGQ7ajVcmy8+3GKA8lPx8c=; b=JS8OW8h2kGWJ0M9S3OsnyOp6SP
	zeO6gOxevdKh+hVnZT4UjrbXXUcUhiFWLe8LOv/1PlfPpvL50We6CXswwdFGe1jiNyp0KNU3dEJ+L
	/PF8dgfKqndPOkxLoDKBWlOIn9DcnOlpSmbCHROM5GOB5AkNUf/UwytVgB2OhUQ1aBKILdYtxPZuA
	ZImkhyLYaoKHRlBes0WBC5u5VnyPHAnM8WUAvtxZ46He2cAG/wa54nor2InHPaJlzX0a53QTP8iMP
	c8ytLvVpGGfZYbYhvTWZG+RIwenv/78A+uTIew9DzPb12y+XxYH4Hy0H28yNZ7dcKmrex77SmysYj
	SxCoTGnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ7cr-0000000GUHP-2uMx;
	Sun, 08 Nov 2026 18:28:21 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ7co-0000000GUFq-3W2G
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 18:28:20 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso28618766b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 10:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794162497; x=1794767297; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7LOc5o/iR4ccdtew0ZugkEGQ7ajVcmy8+3GKA8lPx8c=;
        b=Cw1BPu/jufrdf+FHWz8bIFratCmBo/HWBRpho5epOoxrE1Oad3Y9EbIGr6quaRSANO
         SdNvlFK8aSbljl4TXxHGCSRw7FarWgkdKPvb7YTHkA5r6/h1Mg9t3ividvwIgdnJxg+J
         jZLhqYAAA5QoRip0OBdm5uHAXjP6GDKckZP9LdlEOJyV17gp8q/WlimDY/iYMA2OCUR3
         IOUeAiqcofoggfGZGmgO4q2t6FPSRn35o9c/ve6Qj7+G27iZaWtGpaqKdmE20eSoCYRx
         jkhOq4Tx0DcBcgy5/4anSF+iv0gJwFHrpDVYHk21vkNyW9N7aHQ8QYsd6Qyl5sBSvk8j
         AZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794162497; x=1794767297;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7LOc5o/iR4ccdtew0ZugkEGQ7ajVcmy8+3GKA8lPx8c=;
        b=kXPYmdx9zBx1ZxxM7MEK4x99dZIrigBNM2609IrNiCL4z57JPG0wq3HSe0gTfIsubm
         cuZaK+jm+bIT9ULHs9VZuM1iRYK+7ad7fHp2V1jjjUTJC2tGYJCdpSOaHgZHM2gHHwTi
         GZNPCNsiPtx8l/RO/Hv9swuKfi5NGoUKIn4RdDsAXoRFrum/HiFlI65RV6gh8VqWH16O
         UmY8doCNMuP02GAp+OR8KSmVQ+w3CABuRFUX4uM4I3Dt5kFIChaJa0eFuaZ6vHIHhEhH
         eFs738mYGJCzhXIvXpBDeo9lNHlV0CD+UnC0GRWcE0MunOnacppj7p0MQB4tozZ7r/4o
         GreQ==
X-Forwarded-Encrypted: i=1; AL+hErHPgfiv0mQMMBhOVm9plhVjXFI52yhRqzbPPZxcCtMQkdZiNCdJlijOY5RLU7MbISe6TzcrrxA4XNJiGLqVDABh@lists.infradead.org
X-Gm-Message-State: APuU4Z+IDEfaaAksAvcKWK5eJnqzYVXRV2tMeGPMRJCX7xHyJD/dSTZI
	A4AIkLj3gO1r7HfISgzP/h6pROVdnZ+EdXs7tdNCOq9d5lDocXwyAplV
X-Gm-Gg: AYBFou3FVWIF3fj5v4CcCiabgDI2/7zKM7KqzUTpN3Y/QsfXd7agD3Dv/htzvNhv1aK
	TjZBXnspl08ayq8a5EpWYtzVmb3u5NqZAxXZ95Pt/GWF0lmbReZh0RnHjxEYmyYXw07dUN4qDng
	YnaFYiRkpy7JaL8IUVPg3/kPel0UerViN7XQONPIRVZEHkSpDOsEow4XxJcBnFUZEVvXdmcZIub
	n+dhFB+X8qdrhMV223WfYEdI5OsvGjj+zKEqqjPwilAW5vjULYeeFMvNAxwMnChW3RS9tZTo5Ag
	qa555XLrje10Xn+TKFnqLyoxq962Sh6ktdakYJRkz1lLAWPug7IO+nI9u75MvSyDcHb9mfycXro
	T8UVf5IOG3BUSP64U/OKQPZpxjloAjMljAIT3yuleoocs8torEAWahAfkXC3z38geBvWzDeqSzU
	8d8ppgALsj0dtEwW+Ugl4hWQeOOQj7MiJXZHO6iNZxRfQSp7TJx9+1Zrd7gfAE45ZlZXNcAD1IN
	PTdCMcEv+/bEL5TZv9VrgJF2vEEdpq85I6PYTlheYY/fAEdoOyAe2/Hum6eTZs9yqiVYRmJlahs
	J6e3K87Uq9/2gwt+hLAAX/C5rp1JsfNNcRYgGK+kB7rBfEE0B8mY4C/4t+IR95xN
X-Received: by 2002:a17:906:9f90:b0:c3e:e726:9548 with SMTP id a640c23a62f3a-c4d6d35bdb4mr141902266b.14.1794162496378;
        Sun, 08 Nov 2026 10:28:16 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a47515dsm75254366b.44.2026.11.08.10.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:28:15 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Subject: [PATCH 0/2] pinctrl: mediatek: Add MT6895 support
Date: Sun, 08 Nov 2026 21:27:09 +0300
Message-Id: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBBA0auYWUsCE6XoVYwLpUM7RtEANk2Md
 y/V5Vv8f0CkwBShLQ4I9OHIq89QZQH2PfgXCX5mA0rUSkkjNvY2hVksSZumFqYyiCgfrhos5Gg
 L5Ph7Dbv+dtzHiWz6X+A8fw6MQLJyAAAA
X-Change-ID: 20261108-pinctrl-mt6895-84822207f4ac
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_102818_935116_B7BDC73B 
X-CRM114-Status: GOOD (  12.39  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds the pin controller of the MediaTek Dimensity 8000/8100
(MT6895) SoC: the binding and a driver on top of the common Paris code.

The pinmux macro header and the pio node will be sent with the next
version of the MT6895 / Xiaomi Poco X4 GT initial support series.

The tables come from the MediaTek driver in the Xiaomi kernel source
release [1]. They were checked field by field against that driver and
against register dumps from the device running the vendor kernel.

Tested on a Xiaomi Poco X4 GT (xaga) on top of next-20261102: pinmux,
pin configuration, GPIO and EINT.

[1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/tree/56ec519f6
    (branch xaga-s-oss)

Assisted-by: Claude:claude-opus-5-5
---
Alexander Letuchiy (2):
      dt-bindings: pinctrl: mediatek: Document MT6895 pin controller
      pinctrl: mediatek: Add support for MT6895 pinctrl

 .../bindings/pinctrl/mediatek,mt6895-pinctrl.yaml  |  228 ++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6895.c          | 1617 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6895.h      | 2717 ++++++++++++++++++++
 5 files changed, 4573 insertions(+)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261108-pinctrl-mt6895-84822207f4ac

Best regards,
--  
Alexander Letuchiy <asalde.le1@gmail.com>


