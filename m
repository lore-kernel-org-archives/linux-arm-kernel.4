Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7592606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4edzGaol;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=WTMp+1TD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=39aXfXJaj/hKAWo1P21hHRJATdJb5Rs7OG7RxKc4hF8=; b=4edzGaolkvL+lof508s0tWy5J5
	p2Ch4WDD4s71dBUCpks0KmbEAOjDayxCB/RxIgdg5f9FGZtZMEngl9GaY29p+GQDfLAMv5BFOFDUA
	nG0Q3RSI4ZpHlYB+HcNyE4F/hFym7s8puqu/017FfY5FbmzTxkqtlH9rGOhaOH6PlP2hiC9lIRhbg
	evwaLvGQu7WQ16rAokhVV2mDgrP5F318HKpk6U1109sFJQ7AmLf5Xx8g0nvcHM2PWxfqQHJJXqWcW
	uJRbRRO80pl8x2t0iBLDZ/0ZpQewZwEnZeqD/H7vZiUKFRf0/zjrvcqp36Gf3+vnU+gjsHB6G/UkR
	dWK7B2uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZWo-0000000DLmU-05v1;
	Thu, 26 Nov 2026 13:28:46 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZWE-0000000DLXQ-3eDU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:28:12 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fcb6;
	Thu, 26 Nov 2026 21:28:07 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vkoul@kernel.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	manabian@gmail.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH 0/2] dmaengine: lpc: Unregister DMA routers on removal
Date: Thu, 26 Nov 2026 21:28:04 +0800
Message-Id: <20261126132806.4091183-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2180abfae03a2kunme5d0c11035d95d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQxgfVk4fTh0eHx0YSUgZHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=WTMp+1TDotC5W7xTuPrRzm83WJnYqsdlCjo0E4XBK+/WJ/XI5LKCTD/O7hn0cO2/BQpk354pemtXRPF4A2KdLnlZCtBc7NqJudyo4eKIruptlZ+CGxtHQNPozswWrhWit3WOo3lfQvYUwohCquyAh9YdrnZzZB9Zy2bpz8/Mzm0=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=39aXfXJaj/hKAWo1P21hHRJATdJb5Rs7OG7RxKc4hF8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_052811_202909_B15A3103 
X-CRM114-Status: UNSURE (   2.44  )
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_LOCAL_DIGITS,
	FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

Pair router registration with teardown in the LPC18xx and LPC32xx DMA
mux drivers.

Tian Xuechen (2):
  dmaengine: lpc18xx-dmamux: Unregister the DMA router on removal
  dmaengine: lpc32xx-dmamux: Unregister the DMA router on removal

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5

