Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0B0606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 11:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CgIhaCC9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yKa/SJsZoy3L77tACjfE73Ev0l/hJb0jpU91mGNVzAk=; b=CgIhaCC9Ib0wbLHo63WLtJ5KY2
	6ko4v7ia4T0dy9Z2PcV3WCpIbx83J6330aq5satw4SqmdXTeqHZXPCGNalsqhR90R+ZShEuP+W0ad
	Za4VECibI+h+9kQEqaodJlI2NDCd6SH5DxMauN7m3fgs20AsZd7A6CgRKuek1fhHdr1E+7voICYV0
	6aC6u7LVAZxAXKfE5NFKJAc9bDskirJxbcr9KR67UiwWjy2nIiD3vfLoCdWe76L2abfeow4Hzt2Q7
	Bcv5aInyFrqTe7aUC5NyuVx7fN9fB7kElm8o2A7WWImfiSsOsm22pO56QkHokOeyQV4AUtpu9N740
	rLH75aKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBd8-0000000FrOc-0C4n;
	Sat, 14 Nov 2026 11:09:10 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBd5-0000000FrO7-3Ddr;
	Sat, 14 Nov 2026 11:09:09 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSBct-000000003wW-0j3P;
	Sat, 14 Nov 2026 11:08:55 +0000
Date: Sat, 14 Nov 2026 11:08:51 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, Marc Zyngier <maz@kernel.org>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] media: rockchip: rkvdec: add support for the VDPU346
 variant
Message-ID: <cover.1794654074.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_030907_814702_5A3A120D 
X-CRM114-Status: GOOD (  19.67  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds the VDPU346 decoder of the RK3566 and RK3568 to the
rkvdec driver, for H.264 and HEVC. It continues Christian Hewitt's v3
[1], whose three patches are carried unchanged; in the v2 cover letter
he offered to pass the series on. Patches 3, 4, 6 and 7 are new and
come out of a comparison of the driver with the vendor kernel driver
(rockchip-linux/kernel develop-6.6, drivers/video/rockchip/mpp) and
the Rockchip MPP library, followed by conformance runs on hardware.

Fluster on a NanoPi R5C (RK3568B2), GStreamer 1.28.7 v4l2sl decoders:

  JCT-VC-HEVC_V1   142/147
  JVT-AVC_V1       129/135
  JVT-FR-EXT        65/69

HEVC failures: PICSIZE_A/B/C/D_Bossen_1 are coded at up to 8440 luma
samples in one dimension, beyond the 4096x2304 limit of the decoder.
TSUNEQBD_A_MAIN10_Technicolor_2 has unequal luma and chroma bit depth,
which the driver rejects for every variant.

H.264 failures: CVFC1_Sony_C, FM1_BT_B, FM1_FT_E, SP1_BT_A, sp2_bt_b
and FM2_SVA_C fail in JVT-AVC_V1; the Hantro G1 of the same board
fails the same six with the same GStreamer. In JVT-FR-EXT
Hi422FREXT17_SONY_A, Hi422FREXT19_SONY_A, HPCAMOLQ_BRCM_B and
HPCVMOLQ_BRCM_B fail; the two BRCM vectors fail on the Hantro G1 as
well, the two Hi422 intra profile vectors are not understood yet.

SAODBLK_A/B_MainConcept_4 and FREH10-1/2 are counted as passes: they
decode correctly and exceed the default 60 s fluster timeout only
because the checksum is computed from an uncached mapping of the
capture buffers.

Patch 4 is what makes the score deterministic. With the read caches
left in their reset state, RAP_B_Bossen_2, WPP_D_ericsson_MAIN_2,
WPP_D_ericsson_MAIN10_2, WPP_E_ericsson_MAIN_2 (HEVC) and
CAPM3_Sony_D, MR8_BT_B, MR9_BT_B, NRF_MW_E (H.264) produce wrong
output in three runs out of three; with the patch they pass in three
out of three. This is likely the source of the artefacts reported
against v3. The function is shared with the VDPU381, where the cache
block is mapped by the binding already; the patch has been run on the
RK3568 only.

Decode rates with the series: HEVC Main 2160p 92 fps, Main10 2160p
77 fps, Main 1080p 380 fps, H.264 High 1080p 197 fps.

On the row and column buffer sizes raised in the v3 review [2]: the
MPP library uses one vdpu34x HAL with one set of size formulas for the
RK356x and the RK3588, so the variant keeps vdpu381_rcb_sizes.

Known limits, none of them introduced here:

- FFmpeg's v4l2-request hwaccel does not set the HEVC EXT_SPS_ST_RPS
  and EXT_SPS_LT_RPS controls, so HEVC through FFmpeg decodes wrongly
  on this decoder as on the VDPU381 ("Long and short term RPS not
  set").
- A decode error on such a stream ends in the IOMMU page faults and
  the oops reported against v3 [3]. The cause is in the error path
  shared by all variants: the interrupt handler restores the IOMMU
  while the watchdog is still armed, and the watchdog starts the next
  job while the IOMMU is detached. "media: rkvdec: Handle interrupts
  without a current context" [4] covers the oops; the remainder will
  be addressed separately.

Patches 3, 4, 6 and 7 were written with the help of an LLM coding
assistant, which also performed the comparison with the vendor
sources. It was asked to review the v3 series against the vendor
driver and to complete it; the conformance and A/B runs above were
done on the board with builds of this series on Linux 6.18.

Changes since v3:
- Add "media: rkvdec: vdpu346: Limit HEVC EXT SPS RPS dimensions"
- Add "media: rkvdec: vdpu381: Program the read caches"
- Add "arm64: dts: rockchip: rk356x: Order vdec regs by address"
- Add "arm64: dts: rockchip: rk356x: Clock the vdec at 400 MHz"
- Add fluster scores and failure analysis
- Add Tested-by from Diederik de Haas

v3: https://lore.kernel.org/r/20260110053727.2295260-1-christianshewitt@gmail.com
v2: https://lore.kernel.org/r/20251226113140.573759-1-christianshewitt@gmail.com

[1] https://lore.kernel.org/r/20260110053727.2295260-1-christianshewitt@gmail.com
[2] https://lore.kernel.org/r/DFL5TY0QQNMN.1RS04UM9D1V8S@cknow-tech.com
[3] https://lore.kernel.org/r/DFRU6ODDM71P.3NQGLRK8IVDUY@cknow-tech.com
[4] https://lore.kernel.org/r/20261026124808.642373-1-a.kazinsky@ideco.ru

Christian Hewitt (3):
  media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
  media: rkvdec: Add support for the VDPU346 variant
  arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X

Daniel Golle (4):
  media: rkvdec: vdpu346: Limit HEVC EXT SPS RPS dimensions
  media: rkvdec: vdpu381: Program the read caches
  arm64: dts: rockchip: rk356x: Order vdec regs by address
  arm64: dts: rockchip: rk356x: Clock the vdec at 400 MHz

 .../bindings/media/rockchip,vdec.yaml         |   2 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  49 +++++++
 .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     |   2 +
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |   2 +
 .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     |   9 ++
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 121 ++++++++++++++++++
 .../media/platform/rockchip/rkvdec/rkvdec.h   |   2 +
 7 files changed, 187 insertions(+)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0

