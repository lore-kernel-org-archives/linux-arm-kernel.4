Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD028606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 19:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QZhFE4rl;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=N7ECeJyd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cV6zCHqgqIXodqu1pLKZgWGLibpyplphNM97IttR0BM=; b=QZhFE4rlQFYFhC
	EW74aptC1r+oNKxlLdohpzAtZibjIuDTcg4BSS1O8uaK9LwQ3S1uKALk2jVki0M2p55jKoqcO39W/
	ML/5rN85CadGfvF1Y/rNu2C7ewCNGEyqcb0aRKWCy8XWdRMf8+1o1XotTAaDdjeB/ut9R31z/V3Gq
	nAjtOTJwfwpSgIXeVnYeACqKlK4araCYLsULtFxzLmQzxedXneWVttfTj9QOMOs8btMeu1Ngt5PH+
	U04/W316T/I4OdQx9YfgfvTSZtkkQGLLa2pbXfVvf+M61ydZIA03dMdowOxdQvvd4w3eE/wDbzplK
	qw/j2QXmBcFSldmJ2Bng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOca-00000006pm9-1kmf;
	Tue, 17 Nov 2026 19:13:36 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOcX-00000006plj-0InN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 19:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=cV
	6zCHqgqIXodqu1pLKZgWGLibpyplphNM97IttR0BM=; b=N7ECeJydX0kt4fxJRf
	FXJZUmNKhDNUee+aGAxUZoQrkuwhdGcxX965+MU4qSdMrvEbwYAnkx1Tm3wGxSEQ
	Y1+PPV5Y0dWMJBu9oLziAhCDPlDSr4CWvYviR3wLbko/sqyFHuyXDqRzEKAX2L3Z
	DMyFfQ2XueZkg0CUEuNWkbALI=
Received: from user-VMware-Virtual-Platform.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3X7BHp_xqK590Hw--.29024S2;
	Wed, 18 Nov 2026 03:13:12 +0800 (CST)
From: Ziheng Wei <zihengw03@163.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] dmaengine: at_xdmac: handle empty transfer list in tx_status
Date: Wed, 18 Nov 2026 03:13:11 +0800
Message-ID: <20261117191311.2146922-1-zihengw03@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <avyaLhOo8fdAIvUi@lizhi-Precision-Tower-5810>
References: <20261115080245.910534-1-zihengw03@163.com> <avyaLhOo8fdAIvUi@lizhi-Precision-Tower-5810>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3X7BHp_xqK590Hw--.29024S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrAFy5uw13CF13Aw4xJFWxtFb_yoWxWwb_uF
	s3G392y3yUCF4fCF42kF4Ikr9IkFWxX3WIq340q34SyF9xAFZ5JrZYg343X3WfJwn5tws8
	C3y5ZryfCw1YgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0K2NJUUUUU==
X-CM-SenderInfo: p2lkv0ljzqjqqrwthudrp/xtbC7QrVJmr8p0oNSAAA3q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_111333_526370_716D07B3 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 01:17:18PM -0500, Frank Li wrote:
> suppose below patch can fix this problem
> https://lore.kernel.org/dmaengine/avdni52GEjf_B3vE@lizhi-Precision-Tower-5810/

Hi Frank,

Thank you for the pointer. It looks like the same empty-list issue in
the Xilinx driver, and the list_first_entry_or_null() guard is also
what this patch uses in at_xdmac_tx_status().

Since my issue arises after terminate_all() empties xfers_list in the
at_xdmac driver, I am not sure whether you meant the Xilinx patch as a
reference for the guard, or had another suggestion in mind. I would
appreciate any clarification.

Thanks,
Ziheng


