Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE18606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 18:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oQS+gSK4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PvtPtp3J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xJO/OmYsZbOpn42pFuKnAMKubcS7Hm/7IZ6VUtlUljg=; b=oQS+gSK4jgyeNIyCgM+hSh2x+l
	raoYaj/eVLedb1NRR5IfR+vy8DIB6BAo/5j6lp+QZBTMKOB9u6kTTbUyGEA3hxKfrBpIhTFNmPkCb
	um763zXXcuib9ki8aYsz8BLoCK1WYy9ChcO60nJAKg9VIEaIKFulViT87MjOjfLr9XXJF5KGMzub+
	WBpWMlfBO9v02sTSjnc+jcrAQwrBiZhN0WnrQyTWkt2HUdnjWNlFZC7tc3CBsYiooviisTIOsR1i9
	O3aESZGwBJlu9R4lnbhPa/HPqjQzQaNFgovYw5VQChvhoO/1Tmp5fb2Zed0G3Qu4zBYKk+Jb2u+yH
	mpPQvGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuJw-00000007M9S-48l7;
	Tue, 24 Nov 2026 17:28:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuJv-00000007M8o-3ao9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:28:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B5EB61D7E;
	Tue, 24 Nov 2026 17:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567BA1F000C0;
	Tue, 24 Nov 2026 17:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795541322;
	bh=xJO/OmYsZbOpn42pFuKnAMKubcS7Hm/7IZ6VUtlUljg=;
	h=From:To:Cc:Subject:Date;
	b=PvtPtp3J/OSEiGZKGAHlU2/Mkkh/EoHCtGmaeaDTU1lGmMqULOxGlY5q+hQs2QwG8
	 7r1A/aowCqx0jXc7z8JUqrYd2CU2e7T/tMHmCJ8H9mmRya9c7N00KSKG4o+wBxQ3AX
	 SvBMWlSi5BlbEd0s6yUrp0Dj6R6OUKoamtW1B/i4YQVmP+/ojtqHg3y4XxKxR4PJpu
	 dPJoYsm3HbS4/it38faD+WciPVsl6sgQXZIyaloumr15LRVCxtKRt4qOyFwggzpbEd
	 GHH3+o7RBAIijvel1t4Z/BQGSgWXDxDHpdzABvF1G86ZkCytE1z6ILiOliK1CSkTZa
	 UORzBS04L26JQ==
From: Geert Uytterhoeven <geert@kernel.org>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v7.5
Date: Tue, 24 Nov 2026 18:28:34 +0100
Message-ID: <cover.1795540796.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Geert Uytterhoeven <geert+renesas@glider.be>

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v7.5.

It consists of two parts:

  [GIT PULL 1/2] Renesas ARM defconfig updates for v7.5

    - Refresh the ARM SH-Mobile defconfig for v7.4-rc1,
    - Enable support for Renesas RZ/T2H and RZ/N2H RTCs in the ARM64
      defconfig.

  [GIT PULL 2/2] Renesas DTS updates for v7.5

    - Add more timer support for the RZ/N1 SoC,
    - Add PCIe endpoint suppport for the Renesas Spider development board,
    - Add CAN-FD support for the RZ/G3L and RZ/G3S SoCs and their SMARC
      boards.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

