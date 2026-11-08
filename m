Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13896607599D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 20:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rjCYAxYX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahWlRXzo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i0ZLjJo/UfIz3f09M0iovuRDq8GoCb76iB0KMLGuC6s=; b=rjCYAxYXBQoLKd
	U25SsXsm1bnvjypz8TawNAVBu4X/rkRcofl0kkBpCU1QDb3Q0YV/+sY5WB5OmCnztWH4z10n61FRe
	6soa5/6zJtRq6WnjB0JStCBinm0QfTWeJL+wiLkO+360yOHBKAxESG2uD47CczUlqMvyM0kNZ9ikc
	8Ov7/7q1N4pM1cNgICkoT1U/tk2q02Rf1V02ErUTTsPbWVF6lU/XWf+yyClv36+eTvjSLkK25SPyI
	t/C0hebvIJpa8R8/rMuQiYjrtfuFVgE6i0yI7Tqr0RHEuZ5uGwcMRNlRXwxMD0+19ZDPQgWQVvky5
	H0uDBd4TuVaVzkZ7NuBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ9Qd-0000000GZX3-01t7;
	Sun, 08 Nov 2026 20:23:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ9Qb-0000000GZVh-1UnR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 20:23:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C6E7044E7C;
	Sun,  8 Nov 2026 20:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E2D1F008AB;
	Sun,  8 Nov 2026 20:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169428;
	bh=i0ZLjJo/UfIz3f09M0iovuRDq8GoCb76iB0KMLGuC6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ahWlRXzodFcAI9X50iZq/FgVLt6m1TBlVHBbk7o008LC0kr359j92wR7PdugRnvxt
	 2LiIZPwqqBEBUiy+QJvgYmmc9hhEf72enEvrCXJ9qaqYV2DH5GnXkbAkmu1Plstb9R
	 kjJwAXNDayncqvnTyVpH7MJwty4MEz9fziqioV7rGjIU8mmHMrONgai94Hv1xJEUFo
	 45wIH+8j5fzVIj6WaMGMmHn5VaoFAeyW78/61+mWqwwqvVNyXEbt2eb4J5w2xrN41o
	 1xb1eztu4d3V2zxhrngaQ1mtR4/95x2AOvyBWw7kq5thTjMjryn7RGoaFbS+fiWI6/
	 SeuALJ9xsLaGQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5] ARM/arm64: defconfig: Drop redundant Qualcomm interconnect entries
Date: Sun,  8 Nov 2026 14:20:30 -0600
Message-ID: <179416929565.628393.5609774813055347117.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104-interconnect-qcom-clean-arm64-v5-1-395baa0c0bdd@oss.qualcomm.com>
References: <20261104-interconnect-qcom-clean-arm64-v5-1-395baa0c0bdd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Wed, 04 Nov 2026 15:46:20 +0100, Krzysztof Kozlowski wrote:
> Drop all drivers from defconfig which have defaults in Kconfig.

Applied, thanks!

[1/1] ARM/arm64: defconfig: Drop redundant Qualcomm interconnect entries
      commit: f3f0178e6d6a625ec9522f194420de99934bcb60

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

