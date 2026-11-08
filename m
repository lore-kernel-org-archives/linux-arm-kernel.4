Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1422B607599E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 20:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U+D2fU32;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R/AmbXwC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pty5Na5czxWmLcr3DhwnruNlYgAYUZ0cOJMqyYF/qPo=; b=U+D2fU32o9hIFh
	Ym8nMVDUvWhuPQmVtIyNFZMUdIShghvsVEWMwGOVv/lj7kcnbo9A+i/QPEwKtQm3TRS4Pk0JcoY5C
	L9uOSxICAXruQ67fJN13PpQkYQs3XeCB85fiyEX3ir9aZGgbmO5iWudd76l5AWQJ8WjZVmd8a4ZKM
	2/xFmafSyCRyRUSs3T1w1EE3Hz65cQztvN5OU5VxDFlIy2iAEx+D5dcwvhCvYBv7YyFAE06NDyCNp
	M3UkHliQ0/POj2yN7PzqAP5XxgzW0ASLWh1UhKqWikQICsSl6UhiWMwwBECMsCn67nQ6p9VVwSAX9
	ddGNgPavFmxJOOyCnfJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ9Qc-0000000GZWj-3j3E;
	Sun, 08 Nov 2026 20:23:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ9Qb-0000000GZVZ-0R8z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 20:23:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B63761D36;
	Sun,  8 Nov 2026 20:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F671F008BC;
	Sun,  8 Nov 2026 20:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169427;
	bh=pty5Na5czxWmLcr3DhwnruNlYgAYUZ0cOJMqyYF/qPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R/AmbXwCyIf/6qaAWYpld/3ApbmG8zuTbRfCFm11EBFAQJm/vSGNZ/laXtuhHNdWI
	 3SjfQHs/hm+DkZ0ANWGBw+5qLuA72ZYwH16ewqQUlZrj5e5tjytzMA7sDFNF+Nh9D9
	 mJvNprpTPSLWLGmTmyU4bcq4/7l574YIo6b79moele3g+31ZfKHcnCNATYMvVycAxy
	 Htl3em2lNJG8XfkPQp61cZLERAtgLrEcdxiXAFOd9uGQIQp4BuWkPFLfcvh5ex2fsT
	 otnQzuSAztCq7StxpxlLPHBaWJvLKUvAoZTb6sl7UBHyLDDtB/xIUy4pYIVGwOYLWg
	 +OO5uBSWsk1mA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] ARM: defconfig: qcom: Drop Qualcomm SoC drivers with defaults
Date: Sun,  8 Nov 2026 14:20:29 -0600
Message-ID: <179416929563.628393.4268358059417035573.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104-qcom-soc-kconfig-v3-1-6bd233ccd1ba@oss.qualcomm.com>
References: <20261104-qcom-soc-kconfig-v3-1-6bd233ccd1ba@oss.qualcomm.com>
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


On Wed, 04 Nov 2026 15:40:26 +0100, Krzysztof Kozlowski wrote:
> Several Qualcomm SoC drivers have defaults, so their defconfig entries
> are redundant.  Keep the few options which choose specific choice
> different than the default.

Applied, thanks!

[1/1] ARM: defconfig: qcom: Drop Qualcomm SoC drivers with defaults
      commit: fc5dca8a2541450d7035f339e35008ca99c001a0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

