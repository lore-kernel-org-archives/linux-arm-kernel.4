Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3923F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yN/jcPxW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nDj8K+qy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=buJkffQhJO3hc32EzrqEjXjQ+tCma0DtcEUUCUlPmvg=; b=yN/jcPxWHyfw0HJBigpjm7mNMX
	dRwfLCPZswLHinm6+OVV/Oq5G4vPVYO3gqDIUGrCQ62AJOzhAvI407eKNlJUfqBe8N0ub1rxVLoct
	QVaAx5ochnfma/Z/O+8+tUFxI7IA/jLrmCG6X01QSp0MIb9n0PQzS9RmJlJItC1jMIgO3i9StyEt9
	jpbwyiv8wYiMxwhT4WwYlmsRGKXIOFG4pq2Da3CdSPGk+AE7DS/NueUfK6vgHf2h+Iiio4ac3zQWS
	BoTsQHjDixJe+l+CE0JL7Jmm/VgrNwxBe46zvqG3/vynu6g4VoDqPVXPw/vZeLp7a3P2+5k7jwwJD
	hFt38iLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfCT-0000000EJDa-1Lvw;
	Thu, 26 Nov 2026 19:32:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfCS-0000000EJDP-0S4L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:32:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF0CA40B08;
	Thu, 26 Nov 2026 19:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3081F000C4;
	Thu, 26 Nov 2026 19:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795721526;
	bh=buJkffQhJO3hc32EzrqEjXjQ+tCma0DtcEUUCUlPmvg=;
	h=From:To:Cc:Subject:Date;
	b=nDj8K+qy0v3yTo1nY9tUJM7lu7aZgXR7RFGfFGPoi5Ry7AUiAFakrfGWX5Rp9BfdU
	 6ebEjiQgH/pJsAIHGw/tkDYY0UEHlwob7SudhSoO7zUXOFRZ26xhwvemiDefuuMX2E
	 /EyBT5XaURx8wEvnFnQOij4f2gNaq2q+VtMGzSZmKxKW6qQgogic6V47Cxfk5kbXEg
	 2CF8BovIbAwywecz1nX7WnU/8fPqyWHop2phkc3VkibylIEVvttC74Tl7+VD0CWoiM
	 b+sD8++SdHbLe34xjTJYxYTQ2TjxRgu2KCx/WkKEhx3neFr9w2CTj2gc08LQs4WqAf
	 NLZH6Qagr+2zw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jianping Li <jianping.li@oss.qualcomm.com>,
	Benjamin Kelenyi <benjamin@wendy.sh>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v7.4
Date: Thu, 26 Nov 2026 20:32:01 +0100
Message-ID: <20261126193202.6214-1-andersson@kernel.org>
X-Mailer: git-send-email 2.56.1
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.4

for you to fetch changes up to 67b58fac77db8d2653e53266f62964cba96397fb:

  arm64: dts: qcom: ipq6018: Drop undocumented 'qcom,ipq6018-wcss-pil' (2026-11-07 18:49:24 -0600)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fixes for v7.4

Mark the ADSP remote heaps as no-map on Agatti, Glymur, Kodiak, SM8250,
SM8750 and Talos to prevent the kernel from accessing memory assigned to
the DSP, which can cause external aborts or resets.

Fix the Glymur CDSP FastRPC compute context bank addresses to match their
IOMMU stream IDs and avoid translation errors.

Remove the undocumented and unused WCSS PIL node from IPQ6018.

----------------------------------------------------------------
Benjamin Kelenyi (1):
      arm64: dts: qcom: agatti: Make the ADSP remote heap no-map

Ekansh Gupta (1):
      arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg values for cdsp

Jianping Li (5):
      arm64: dts: qcom: talos: Make the ADSP remote heap no-map
      arm64: dts: qcom: kodiak: Make the ADSP remote heap no-map
      arm64: dts: qcom: glymur: Make the ADSP remote heap no-map
      arm64: dts: qcom: sm8250: Make the ADSP remote heap no-map
      arm64: dts: qcom: sm8750: Make the ADSP remote heap no-map

Rob Herring (Arm) (1):
      arm64: dts: qcom: ipq6018: Drop undocumented 'qcom,ipq6018-wcss-pil'

 arch/arm64/boot/dts/qcom/agatti.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi  | 14 +++++-----
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 49 -----------------------------------
 arch/arm64/boot/dts/qcom/kodiak.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/talos.dtsi   |  2 +-
 7 files changed, 12 insertions(+), 61 deletions(-)

