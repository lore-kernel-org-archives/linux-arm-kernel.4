Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA4F606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GrIfuxA4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLaRygo8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s78Uwu3z/zaPq9zjWKMnVssEWBtB7CSjhkYzBSt1kL0=; b=GrIfuxA41yFmL9
	pz3zshWGCwfgRie8n2fDaGkeoS9w/1JR1JDS86K4G4aL+q+cYibOwuAHzTe8LFMSspBm7G8w9zIR2
	OjxecaCIjI/8S1Tubt42TUlzfNmKvSrSu583HHWdkg3friCY+y+IZeJbZPF7eX56kNmMeQjwabkJ2
	0M3gNz+5oTbAWOnnoilKwULqLbUxsbL2Rm47TgTbvFAERjl3z3bd4TRfSCYtjFUq/t9upti05KyM0
	C0JRgPPR24zwvliHJS5UoXZTva7cfq30hpcSCWxxsgVPwvenb0LUPrGTMa6O/XMiC5rxHZwk8GMRl
	t02/RGYSIN68j3bXHgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1KJ-00000003WBl-03SW;
	Mon, 16 Nov 2026 18:21:11 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1KF-00000003W95-16wO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:21:08 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cc147d86bebso113720a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853266; x=1795458066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s78Uwu3z/zaPq9zjWKMnVssEWBtB7CSjhkYzBSt1kL0=;
        b=jLaRygo8gqOrhSsDrtHCGa9vC1s0t/4WzfjGMA54tmNFfze3Y70qbO+mg6tQOSC46D
         q/bE5z3nK+SABqclfS92DYU/MBPOcTS5XaPc2gW8OM9vba3qksr7uzKpb8QSthmtS0l+
         WI/oM2lC0NHYdllgAGwLm3o/tBpu9e6JW12OSIDbAOMr+8SdQ2TywI7+XeRFZ+DrnodJ
         xdKYIqyDXQE0WkPSjUzCHETrkyYlWKDVgCWReB+pi9PvCXFsQfU/Yny5fzzcJ+nK0mPZ
         bnm4/gth4sN6JJ1inlMh45q4xjQJ6NG9T4dLcwvEEFCmmRQpV537sz9iczoZW6fDPM5o
         Uu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853266; x=1795458066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s78Uwu3z/zaPq9zjWKMnVssEWBtB7CSjhkYzBSt1kL0=;
        b=cQsNGDTpbTGoLO7FXn7Pb1Lw/cXuzs1xtcthcsIXAq00fbTv9PS4vKhonyEiq2Yb4A
         0q9fT0QOJS5uBcCxmuWOzfUVq/n+Mv/CJR6kRfxq7GZMFcj9K4/LEusGlDmU64b3WpIe
         61HmWHVJGWxPhedS132Gvrn8LrrXNRp8rjtiafjcBuKokO9yBljbWAtZDOy8fhn1eAgc
         dk+a+LN99EDi12kMtdibSqY1lH1+GhFPjGhbrZrqbouvhC3+CC56+5pfxxHtgnHh042l
         amyaayJ5rqeETYgcpnHCHpersdoV2XvgUm/ARzP9/ZW3+MgP145WCTR+14yhCJvZZVOy
         QqhA==
X-Forwarded-Encrypted: i=1; AL+hErFCiFnCt1E9rY25lWRVrzgwTgxefCiQIBikhWF9YSLjoEgzmxy4zH0LkdmS/9AGfHQr/i9eVumWvltoOeH/SyJe@lists.infradead.org
X-Gm-Message-State: APuU4Z+O42nmWqEX5yRzLbOeBlYI34cwOs69MD2G9e63L3jNj+1EjRmy
	+JgnUrefwUcm/kHwT8O3ZBQwAqgsnEFgjWh3C9o0bW+y725f0dHu7f9c
X-Gm-Gg: AZFdTZcIRLw5tBhASHCgnQEV7l9Qtm7rchpHgRW7Yr16KtBffFLdEsFuKyHRswov57f
	HhpTVsK0XQk3TuamME6C/M6acqDRqF1lcUy1hYI3nlybQ0kLfHZv0dPf3W1HLZxC5Zv4qaggcb1
	/QGofb4CYNnYOSg4TmfxtaOBzwXQXabHttD0HhsQPAzVbpW4CrvgeGu9NgMjhTmwxg5pFi3rHtV
	Cdme//5cFV6pHKrDjXhsHxRvN7vIOBCge6djTd24+XTl/I2QS6MmqSbqPLM6M6DaWTv/zuXk5Pc
	hVW3Q+OSymONdQUzNKs7krpjTnSoh5GivcU9MZQ9IDtrbJ42+SjbVFwi17KQy3QVE5BgvIC9exe
	9fWbCrit9o/txWV7pcaZIelPmJtBfVlA/1GzYTlP8UwEgXfR/busCLuc01E64qKHgU2X75VsA8b
	TgaCCZKDLrd2dIILo2VyoDuJ5jSTi0MoGIed0nHZWoy9NLsMp/gscvX/nf7cf9W7aJVPYzCQgxg
	oQUYtJAdkHOzrBJoy4moFtKpmI4GuB8s0DNEhACov7fZ/qzkWlTaFzjxwRHhAUD1Umr3XVh3Nq/
	csyEeifDDmXA3oOyfOUo5MEfy/I/jRWZqMZ6MDk6bqIJyIIvQjGoiDe/lAK/p5SDNExG+hd0+Pw
	shkzQlPD8arKFqKVECOOpok/m26FW9UQD9jxv
X-Received: by 2002:a17:90b:17cc:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3b3abd01770mr154654a91.28.1794853266130;
        Mon, 16 Nov 2026 10:21:06 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe8b263sm376117a91.13.2026.11.16.10.21.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:21:04 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com,
	netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next v2 3/3] ptp: ocp: support the WiWi revision 02 Time Card
Date: Mon, 16 Nov 2026 10:21:01 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-r2-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179484681859.3136.5472457983791141613@kernel.org>
References: <20261112163333.12523-4-ahmadexp@gmail.com> <179484681859.3136.5472457983791141613@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_102107_312119_4C524F67 
X-CRM114-Status: UNSURE (   9.45  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks for catching the second path to the flash. Blocking devlink alone
was not enough. In the proposed v3, ptp_ocp does not register the WiWi SPI
controller or enable its interrupt. That means no spi-nor or raw MTD for
this card through ptp_ocp, including no MTD reads. Devlink continues to
reject the operation. The existing boards retain their flash devices.

The static board match is 2163:1008, subsystem 10ee:0007. The class and
programming interface are not part of that match. Probe resolves WiWi
against the static table, so a dynamic ID cannot select a different
resource layout. PCI revision 02 identifies the register interface; we
still validate BAR and MSI-X geometry before touching the FPGA. The WiWi
XIIC child now has typed platform data and its own matching size. No cast
of another controller's data or stack copy is involved.

I cannot infer GNSS2 wiring from the PCI revision. The proposed driver
therefore exposes neither a second UART nor a GNSS2 SMA output on this
board. It no longer prints GNSS2 as a fallback MAC PPS2 source. The
independent external SMA PPS2 input is still selectable. This is a
supported-feature policy, not a statement about untested builds.

I also clarified that devlink reports the build ID as fw and does not
distinguish an active image from a fallback boot. Unknown revisions are
logged with two hex digits. The revised objects compile and the
board/flash policy checks pass; this revision has not been run on the
card.

v3:
https://lore.kernel.org/r/20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com

