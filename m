Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2169606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EI0VQmfG;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=MnxzOx9D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3ddNMHunRkB0O0QsoA7pd9wVv/0W9Lfu97gA1D6q22Y=; b=EI0VQmfGZyJsDO
	SVWbLJqk19CR7mt2G0+k61YxJVNr3e+xvd9pm8gfcEmjMjz3dOqJb92j5l2Q0FVWpKps62OQxSszt
	FZOlWsCoHSMOHB4mi4rOqb+YeF0vTjExU6t/+tpkH2HFTlpG/aw1euPjMMr6Z1tI7lTc0AgaCkd0T
	EemBpVNcrX5m40hqTHcjngT2q+MooHYn9MAp6oURIjKHUVxgw46CI5AotS87NdLPRj8YjODodZ2I7
	R2TXxjv2bHO2yKvpEZrybHMDPNX8zoWTMzaAYQ4jmPzeK6Z68U27Omx5wh+hkXLTEK4QcI+baGHHk
	6I2u6QytbYYzqyuKATbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqsb-00000001Mrw-1IQw;
	Mon, 16 Nov 2026 07:11:53 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqsY-00000001MrU-0olO;
	Mon, 16 Nov 2026 07:11:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794813102; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=IW6TlYuzRhN7B3QoDxPTrfOfNagoQUnVYFzJDo6cpswoRfoUF0FKH/flEQlFIVtwqKCCxeS6ScSzCHezdtIejrTwJGyOrYNkT/+EO6icZRul5nHsrp2XzU9WGIT4k4Pbup3up/PDA/uhDZfWRBMlxROqNW3Bzs1ihqg2xllR8Ns=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794813102; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3ddNMHunRkB0O0QsoA7pd9wVv/0W9Lfu97gA1D6q22Y=; 
	b=kTlsDA4+ZAcC4gHDVf8rbiL04nJ9bJNvWGItQrrDBrrIZgD0Rqx08A4zT7yh90KDdiGpjcTbhDvLnWkh3I3vJDXD6Ec3KH1HVXsRqNScbjeWnaEd5jFKt5udMYHVcpdoGptNoEWGvfWGTHbme21Ra8Sp0sk/pw1A85ORJzPqh6s=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=MnxzOx9DB9Pc3DLzjtnsEsr35z3pdqGGQW7Mp5329orCMLRQj8xJR90OVU03I/0/VsUzquNuZRoOZWxRGnuBnt/sugH9RDH40HS5FlkDEeBBJ5S69DV57vfqCi1YBnUsYnCpuH9q6Iu//qhXd+/QjtBbw40Zj019bZnR8LYJZLM=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=3ddNMHunRkB0O0QsoA7pd9wVv/0W9Lfu97gA1D6q22Y=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794813100805897.2580520315063;
	Mon, 16 Nov 2026 08:11:40 +0100 (CET)
Date: Mon, 16 Nov 2026 09:11:39 +0200
From: Igor Velkov <iav@iav.lv>
To: Matt Thompson <matt@boondocker.io>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/3] PCI: rockchip-host: Handle unavailable downstream config space
In-Reply-To: <20261113-rfc-b4-v2-0-d6b14f95c1d6@boondocker.io>
References: <20261113-rfc-b4-v2-0-d6b14f95c1d6@boondocker.io>
Message-ID: <20261116-rockchip-host-rfc-v2-test-1@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_231150_536750_FD9DE859 
X-CRM114-Status: UNSURE (   6.59  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested v2 on Kobol Helios64 (RK3399, JMB585 at x2), 7.4-rc2, DT without
ep-gpios, 150 unbind/bind cycles, bind pinned alternately to A53 and A72.
A53: the fixup ran 4 times (debug print on the err path); probe found no
device and the JMB585 stayed absent until the next bind; no crash.
A72: the same read raised an asynchronous SError (bf000002) on the dmb in
__io_ar() after the guarded ldr; panic in 1 of 75 cycles.
Patch 1 does not catch this case: LINK_UP and training done are set, the
endpoint does not answer.
Retrying the link bring-up avoids the abort here:
https://lore.kernel.org/r/20261116-rockchip-pcie-resume-v2-1-a633e279be97@iav.lv
With both applied: 4 bad bring-ups in 150 cycles, no device lost.

--
Igor Velkov

