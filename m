Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7538E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 09:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KdYFHP62;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PON7QUIM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=; b=KdYFHP62eszPID
	hRQdpCCS9ZZtSYXeBoBH5Z0e9sktunioHsYcxKN8pfxMoAoUEYMRkdwBr00X70a6Z3p7mYgfngal1
	G9Sx7yGW7RGOk5Gawt6cl15b2wgdcXXfVc2UDJ1C6WfGARPzOAygExz71rJnG7fEvIgAqHDuHiPDb
	ltvQ1Ke1TetqEh0F+8j8PcoKGC5vKC9RAUMBsSH+knCMD9JFE8z829/xQIgeqNpw6vE2ExphjAWl3
	JD6gWanKgqYg0ua+vZ/40tT182OA48E9kR6V8hUSlVZ9gIqU5oF+DPvL7r0LV0mwVPLQYttAV+GpP
	IOo282axb5jqj3nLvvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPyuI-0000000Fssl-3GfQ;
	Sun, 08 Nov 2026 09:09:46 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPyuF-0000000Fsru-2xtc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 09:09:45 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-36fb88ea38cso56769eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 01:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794128982; x=1794733782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=PON7QUIM7+uy5JFsGRS8AZGju1OYm5QW49VEuertjYEreBFro0WrXrq7mVs6wHdtp3
         +8syp5aDmpQ/Jxz5fFmbZO53thx/zZRLdrvLleaRVqp5WL0tPt+0HRkN/WinXm4ztdGf
         z9GMm18NNgUXfjY29lK5QZlwyFEjhPzVd+MxbkPHxa7Aloe0KCxMesnlXUI01wpxIrg3
         JPSZsTTLzSKiCkMPKnffg6CUbnnCpDJvXAc8YVfLJlKSa32W+QlKJeRpEoFdFKh5W83+
         OJGs/LxFgOgpxvPPpuVIvHncdoufh617Qg8+H1BHgGnDsvQVHuhQcZBBYDVWMohqm5zs
         UKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794128982; x=1794733782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=nPx95C7ZQMqhByqt6sWTwAGfVQ76AoeXrfAegdErw5A56A8GxJY1dk5J/eXdXzwEme
         rOaJYX9bp8AsbPeUzuHGC+vWLDjqeq2VfTsJgnEvpoe3mSp1UivAjBK9Xr0b8SGtAgAZ
         7aEyT9uMifANFTOaScfp+4cPyjvcYP81EqtM/8ahpwdr+jciFKmtg3IIdzv6BHNBrGKF
         e+cQEynIZbEIuXGUj1QHFupeHBRWWhEhg5woA6gqNf/wCCtBgi9ErVWEIPXkJDMgAtTM
         PAMgigljks+DWS2F306AC2wsjfANpaMds9WBwJjnx9YTXdDBF/G50g7Sq5wDk/xYmvyV
         AHDw==
X-Forwarded-Encrypted: i=1; AL+hErGeMZ+Sa2qupgoR8k+M6oLLSHioPaFv8segpHZDvkGoP0NaawDizvJWixT8ULAs4nD+CDO8ElgrTteBhhxo3rmR@lists.infradead.org
X-Gm-Message-State: APuU4Z9Xhqu1ygxhCLlEisiSXFfUFu3D4Y+NZvzr2TBr44F4wzNohKVg
	gGeIhOH8jOGfhNHkFod713cP2YfP3ObWyfnE+Qxw+AwdO0uezjOkVWtl
X-Gm-Gg: AYBFou2c0oXSsEyeb7tAUL3lmFMIHO1t6d2vxcsyKCuGtmoasWMWAipaoZtJ+B8LkLY
	uwtWsaYPyRPuleTGHS5UTcsMl0lWMwct7EHYqmLQA0yI4g4DbwCGH0smAmHyPgSd/32d2uYV15U
	p43CUSdPOoc4DKulTGwveDgb0+nGw5LtJjZtSd5Kce1vr9kVGQcLy4cFcVS5hd2HMcmZxt5YwaK
	P0RIk4i1C4AkalKWSBi55jHNozfCmbVuBbX005cCW5TA2PkroLNcOHS0gq4SmOU3y6RcUeBh938
	2168OCehmM1028+6jdumCX44CkUoBsIKwu69GHDt2no+V9O/rmCJ95u/bifKDkAjEhGMsTV3XJz
	yeNLf4ttmFWtT50/9dkv8uYy2PxQBxDsTExUi8Aikeox2R85Fz4vx2AxH/jNLMmBE7l88tTwZsL
	LQkbginWyqP4i3DtH3Er7dhqOc+8OohP0cqhLc1R9UPVmO3/H9ep996d0M1xqCQOIe+mdUwgEFP
	aNhxjxIZ+ZwlBXKXnlL7XSArVQYc+4ObL1pT4bsylg5wq9ZcVhcmCd7/VL3G8Je8fLEHGmqeQOm
	1VSkhxE/B2MaCHldeBdxlle9A9yKK+w4rcUfGLRm2wxEHbKQM8g=
X-Received: by 2002:a05:693c:881c:20b0:36c:a2cb:6ad0 with SMTP id 5a478bee46e88-370f620bf5cmr5775018eec.8.1794128982350;
        Sun, 08 Nov 2026 01:09:42 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561852csm3725259eec.9.2026.11.08.01.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:09:41 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: mani@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	bhelgaas@google.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	sergio.paracuellos@gmail.com,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] PCI: mt7621: Fix reset control leak on PHY initialization failure
Date: Sun,  8 Nov 2026 09:09:04 +0000
Message-ID: <20261108090904.2409-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179407116392.87368.9250979022176600686.b4-ty@b4>
References: <179407116392.87368.9250979022176600686.b4-ty@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_010943_746257_FCC4DA78 
X-CRM114-Status: UNSURE (   6.38  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj

