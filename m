Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F274606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kQiWyYWD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CNPXMpBp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=g0wg2R4D4ws9g0qj9z8FjxgFwkWHzS73xmd1tBLqVOI=; b=kQiWyYWDqzRCEwLZRbEaNoJZvs
	UhuFQI4Bjx5TORNaI9f3g72xS8YBTCICo2aMuPkkD2oX6wYPB9w7+ILY4rk3dIyCOpoUH4gQ3/9WB
	uaJXM2JtBtAJGNdWyb+NF5v/QLMsgChBp6LItHP9asBFu0CPiy4vEt/RTnxkiw3vLp9BgG1UTZtuL
	y3366q4Epiy8ruTTfaXuxIWn+naYormvfOZ2rcRjkDIfG5Jj/trWX26R5Wu0Rqz07hL9IejLkONcd
	f7TyLD7TP/KuXf13C4nOPDpSj0If4Ula1l17V5GG2z8ZMKtDsGzfmtKxCnKXPhju4pCQkrS0Og8H9
	rDhUkXKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTceH-00000008WiF-43NV;
	Wed, 18 Nov 2026 10:12:17 +0000
Received: from mail-ed2-x07.google.com ([2a00:1450:4864:33::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTceF-00000008Wh2-1bWx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:12:16 +0000
Received: by mail-ed2-x07.google.com with SMTP id 4fb4d7f45d1cf-6b71d7b8fbaso288293a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 02:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996733; x=1795601533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0wg2R4D4ws9g0qj9z8FjxgFwkWHzS73xmd1tBLqVOI=;
        b=CNPXMpBppEDEPeIMfMROfwT/wefC/3jR+GcvLLnzPcPNYRW/Tqg8z1NvxEiYvpc0O7
         rbmzH8xfF4l6vFF+nOz9WuwFxTL+p+TiV6xCtbFEA+RRP1Ot/TqskAOMNAnyOOlQrXGw
         IFJ2r+epxxNni/Npx11qSdAgWt0G/cfR6dmO8EMVUyKA5FmLlDwFPb3hpkAVub4n4Fkm
         xoDfPBKBXXDbCcjMi7YHcdkvlCg6nSeOllW6ERTZgrgfpSuGTeIbNSxkt9qlhc5kbWj2
         VuCDBbTMDHJ6bBN+oSlgQj58sweO/zAB1zE99hkufavuN7LNiRsxiuoP1AUoRTCc1Tv1
         q4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996733; x=1795601533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0wg2R4D4ws9g0qj9z8FjxgFwkWHzS73xmd1tBLqVOI=;
        b=eJlcOD6Sv++l0ryBlckul6pnsq9kdAWh732hZSTZYPT20VI0feola4GjQ39sFjjzV/
         kvops3KAfIROBaIptP8rYgel1bq04p8taoDvdfCQtIOuEvmOmy3qzVMQmsIwycko4Wuq
         KXemMGVmNGyHsmjiOU6TK36u+AoXl44XuY87SoPqok4EOogkzBiZjoV4z/DaLFJi4E3v
         4s7AabM1kA1+hBGpDOMoqaU5dA1pddT6fxtzmJzkPKVyISC+Ny/wIwG3s8FB99LRy0nK
         UJEr2v6g5gW8AgmrKwxxppfJfWlw9cxTAJniq9wwetBWoo5Cq4SNcO6B+SQIC2eembbz
         noBw==
X-Gm-Message-State: APuU4Z+ZeoPSp2BE+LBNIH9TLy6x02Tn0iTTSb6lMU6QhHCwAFIrVagH
	SoCgz3Tlz722OGWflOlDQ2j/eVTXMT8KVKfw4u7onbidYas+1jOi4yOj
X-Gm-Gg: AYBFou3fJQcu16HZIg7RkzLQL2IUWs8jCg4kf3qr3B63IH7awqXcOwr/1FI5/F8IpWx
	nsc/QwDPNRevAlGadoXL05RUP3TLp+ggpxl58cR0IieIZBalcHJjnBCk96/mz45T/Gf9F4tS3xm
	OUZjjE4AcM1F24+MRw9tE6EAaGLQ+2/MDwbXUmvva8prq2fPCs44+r6Wrmug4AbMDrBMzF64rvx
	NZlJ709cNcs+4hUNWR5zt1ZrzHyVM7C7Maxdh+PAW0nYXbtMwyen9nefP4Db0jk+yOjHP9P9tmk
	xripJKjD6RFy4yaJR+dGOBWKRjR1fcgzHs40JxYgkzpxVzeufnznsLT5JrIaeHgAwKDpessgJdg
	PnIX0e4pGPW9kZ6J1pkiv6oGURqk+6pjqFzPO1KxamOyx0Iv5MP1ox7zEV8ilUyFo3cK/YsV3y9
	MGiiOQC1CNbHIvjdrT71CmK4T4HDeHq/Es5t3Y6Ey0d7116DL2QFWb67sl4TamSbZjz5p03Uifa
	EJD8rsANhqM4jyCPdQi+EAupT7mWl2yvVL2E4FMzgZHXmOizGyR/S+YJm2usjd7a9sYUP2kAF2x
	Qyer7FxbFQup1dyyWpPlbFXDcDRaaln/aDE4i2mXomU4BJZwwfPOtPJ06iHYqXqTfLNCfRgfvnx
	ImLCl3Re/JyfP1MJU/GacCkxLjnlLNVQlHiNcYYPHJQ4nSPwRosEXDfn99kV1PQMpapb5nfOU+F
	Uw6Q==
X-Received: by 2002:a17:907:9805:b0:c50:93b6:52ed with SMTP id a640c23a62f3a-c510e34dd9dmr172220566b.40.1794996733005;
        Wed, 18 Nov 2026 02:12:13 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510c83f332sm78436366b.7.2026.11.18.02.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:12:12 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [RESEND PATCH v4 0/2] i2c: i2c-xiic: fix clearing of bnb irq and waiting/ clearing while atomic
Date: Wed, 18 Nov 2026 11:11:45 +0100
Message-ID: <20261118101147.3350796-1-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_021215_443160_FF8478E8 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Resend due to inactivity since Nov 09.
I think PATCH v4 2/2 misses a review.
Anything I can do to move this further ?

Dear all,

This patch-series fixes the clearing routine for the bus not busy (bnb) irq
plus the waiting and clearing routines while in atomic context.

The bnb is used to indicate that the current transfer is done.
A high level view of the software flow for tx:

* init i2c controller
* prepare all registers ( fill fifo, enable irqs, ... )
* start i2c txfer
* clear and enable bnb
* wait for completion
* ( serve interrupts )
* ( bnb interrupt ): complete completion

The datasheet ( pg090-axi-iic, Interrupt-Status-Register ISR)
states that the bnb bit can only be cleared if
the bus busy bit in the status register is set.
So the iic controller must have recognized that their is some activity
on the bus. ( Start condition )

Currently the bnb bit is cleared without checking or waiting for this
condition. This can lead to spurious bnb interrupts.

Andi suggested to use an atomic-save function to wait for bnb.
This was applied for other waiting/ clearing functions, too.

Kind regards,

Thilo Zirnstein
---

RESEND v4
- Add Reviewed-by Tag

Changes in v4
- Fix timeout argument of polling in atomic context

Changes in v3
- Use atomic-save functions for waiting and clearing.
- Fix intendation
- Unintentional changes removed

Changes in v2:
- Unintentional changes removed.
---

Thilo Zirnstein (2):
  i2c: i2c-xiic: fix clearing of bnb irq
  i2c: i2c-xiic: fix waiting/clearing while atomic

 drivers/i2c/busses/i2c-xiic.c | 70 ++++++++++++++++++++++++++++-------
 1 file changed, 57 insertions(+), 13 deletions(-)

--
2.43.0


